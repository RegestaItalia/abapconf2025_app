CLASS lhc_order DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR order
        RESULT result,
      initfields FOR DETERMINE ON MODIFY
        IMPORTING keys FOR order~initfields,
      recalculatevatprice FOR DETERMINE ON MODIFY
        IMPORTING keys FOR order~recalculatevatprice.
ENDCLASS.

CLASS lhc_order IMPLEMENTATION.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD initfields.
    MODIFY ENTITIES OF zi_abapconf2025 IN LOCAL MODE
      ENTITY order
      UPDATE FIELDS ( currencycode vat )
      WITH VALUE #( FOR key IN keys
                    ( id           = key-id
                      %is_draft    = key-%is_draft
                      %key         = key-%key
                      currencycode = 'EUR'
                      vat          = zcl_abapconf_2025_utils=>get_vat( 'IT' ) ) ).
  ENDMETHOD.

  METHOD recalculatevatprice.
    READ ENTITIES OF zi_abapconf2025 IN LOCAL MODE
      ENTITY order
      FIELDS ( price vat )
      WITH CORRESPONDING #( keys )
      RESULT DATA(orders).

    LOOP AT orders ASSIGNING FIELD-SYMBOL(<fs_order>).
      DATA(pricevat) = zcl_abapconf_2025_utils=>calculate_vat_price(
        iv_price = CONV #( <fs_order>-price )
        iv_vat   = CONV #( <fs_order>-vat )
      ).
      IF <fs_order>-pricevat <> pricevat.
        <fs_order>-pricevat = pricevat.
      ELSE.
        CLEAR <fs_order>.
      ENDIF.
    ENDLOOP.

    DELETE orders WHERE table_line IS INITIAL.

    IF orders[] IS NOT INITIAL.
      MODIFY ENTITIES OF zi_abapconf2025 IN LOCAL MODE
        ENTITY order
        UPDATE FIELDS ( pricevat )
        WITH VALUE #( FOR order IN orders
                      ( id        = order-id
                        %is_draft = order-%is_draft
                        pricevat  = order-pricevat ) ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
