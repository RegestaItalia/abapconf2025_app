@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED Abapconf 2025 app example'
define root view entity ZI_ABAPCONF2025
  as select from zabapconf2025
{
      @UI.hidden: true
  key id                    as ID,
      @EndUserText.label: 'Order description'
      description           as Description,
      @UI.hidden: true
      currency_code         as CurrencyCode,
      @EndUserText.label: 'Price (Without VAT)'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price                 as Price,
      @EndUserText.label: 'VAT (%)'
      vat                   as Vat,
      @EndUserText.label: 'Price (With VAT)'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price_vat             as PriceVat,
      @Semantics.user.createdBy: true
      @UI.hidden: true
      created_by            as CreatedBy,
      @UI.hidden: true
      @Semantics.systemDateTime.createdAt: true
      created_at            as CreatedAt,
      @UI.hidden: true
      @Semantics.user.localInstanceLastChangedBy: true
      local_last_changed_by as LocalLastChangedBy,
      @UI.hidden: true
      @Semantics.systemDateTime.localInstanceLastChangedAt: true
      local_last_changed_at as LocalLastChangedAt,
      @UI.hidden: true
      @Semantics.systemDateTime.lastChangedAt: true
      last_changed_at       as LastChangedAt

}
