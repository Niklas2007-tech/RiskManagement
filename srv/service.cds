using { RiskManagement as my } from '../db/schema.cds';

using { BusinessPartnerA2X.A_BusinessPartner as test } from '../srv/external/BusinessPartnerA2X.cds';

@path : '/service/RiskManagementService'
service RiskManagementService
{
    @odata.draft.enabled
    entity Risks as
        projection on my.Risks;

    @odata.draft.enabled
    entity Mitigations as
        projection on my.Mitigations;

    entity A_BusinessPartner as
        projection on test
        {
            BusinessPartner,
            Customer,
            Supplier,
            BusinessPartnerCategory,
            BusinessPartnerFullName,
            BusinessPartnerIsBlocked
        };
}

annotate RiskManagementService with @requires :
[
    'authenticated-user'
];
