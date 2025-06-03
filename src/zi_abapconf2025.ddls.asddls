@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: '##GENERATED Abapconf 2025 app example'
define root view entity ZI_ABAPCONF2025
  as select from zabapconf2025
{
  key id as ID,
  description as Description,
  currency_code as CurrencyCode,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  price as Price,
  vat as Vat,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  price_vat as PriceVat,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  local_last_changed_by as LocalLastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt
  
}
