@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: 'Projection View for ZI_ABAPCONF2025'
define root view entity ZC_ABAPCONF2025
  provider contract transactional_query
  as projection on ZI_ABAPCONF2025
{
  key id,
  description,
  currencycode,
  price,
  vat,
  pricevat,
  locallastchangedat
  
}
