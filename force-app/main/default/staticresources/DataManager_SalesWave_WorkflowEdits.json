{
    "Extract_OpportunityHistory_custom": {
        "action": "sfdcDigest",
        "parameters": {
            "object": "OpportunityHistory__c",
            "fields": [
                {
                    "name": "Amount__c"
                },
                {
                    "fiscalMonthOffset": 0,
                    "name": "CloseDate__c"
                },
                {
                    "name": "CreatedById"
                },
                {
                    "fiscalMonthOffset": 0,
                    "name": "CreatedDate"
                },
                {
                    "name": "ForecastCategory__c"
                },
                {
                    "name": "Id"
                },
                {
                    "name": "IsDeleted"
                },
                {
                    "name": "OpportunityId__c"
                },
                {
                    "name": "StageName__c"
                }
            ]
        }
    },
    "computeTrending_custom": {
        "action": "computeRelative",
        "parameters": {
            "partitionBy": [
                "OpportunityId__c"
            ],
            "orderBy": [
                {
                    "name": "CreatedDate",
                    "direction": "asc"
                }
            ],
            "source": "Extract_OpportunityHistory_custom",
            "computedFields": [
                {
                    "expression": {
                        "sourceField": "CreatedDate",
                        "default": "current()",
                        "offset": "first()"
                    },
                    "name": "OpportunityCreatedDate",
                    "description": "Opportunity Created Date",
                    "label": "OpportunityCreatedDate"
                },
                {
                    "expression": {
                        "sourceField": "CreatedDate",
                        "default": "3000-01-01T00:00:00.000Z",
                        "offset": "next()"
                    },
                    "name": "ValidToDate",
                    "description": "ValidToDate",
                    "label": "ValidToDate"
                },
                {
                    "expression": {
                        "sourceField": "CreatedDate",
                        "default": "current()",
                        "offset": "current()"
                    },
                    "name": "ValidFromDate",
                    "description": "ValidFromDate",
                    "label": "ValidFromDate"
                },
                {
                    "expression": {
                        "sourceField": "Amount__c",
                        "default": "0",
                        "offset": "previous()"
                    },
                    "name": "AmountPrev",
                    "description": "AmountPrev",
                    "label": "AmountPrev"
                },
                {
                    "expression": {
                        "sourceField": "StageName__c",
                        "default": null,
                        "offset": "previous()"
                    },
                    "name": "StageNamePrev",
                    "description": "Previous Stage Name",
                    "label": "Prev Stage Name"
                },
                {
                    "expression": {
                        "sourceField": "ForecastCategory__c",
                        "default": null,
                        "offset": "previous()"
                    },
                    "name": "ForecastCategoryPrev",
                    "description": "ForecastCategoryPrev",
                    "label": "ForecastCategoryPrev"
                },
                {
                    "expression": {
                        "sourceField": "CloseDate__c",
                        "default": "1970-01-01",
                        "offset": "previous()"
                    },
                    "name": "CloseDatePrev",
                    "description": "Previous Close Date",
                    "label": "Prev Close Date"
                },
                {
                    "expression": {
                        "sourceField": "CreatedDate",
                        "default": "1970-01-01T00:00:00.000Z",
                        "offset": "previous()"
                    },
                    "name": "CreatedDatePrev",
                    "description": "Previous Created Date",
                    "label": "Prev CreatedDate"
                },

                {
                    "expression": {
                        "sourceField": "ForecastCategory__c",
                        "default": null,
                        "offset": "current()"
                    },
                    "name": "ForecastCategory",
                    "label": "To ForecastCategory"
                },
                {
                    "expression": {
                        "sourceField": "Amount__c",
                        "default": "0",
                        "offset": "current()"
                    },
                    "name": "Amount",
                    "label": "Amount"
                },
                {
                    "expression": {
                        "sourceField": "CloseDate__c",
                        "default": "current()",
                        "offset": "current()"
                    },
                    "name": "CloseDate",
                    "label": "Close Date"
                },
                {
                    "expression": {
                        "sourceField": "OpportunityId__c",
                        "default": "current()",
                        "offset": "current()"
                    },
                    "name": "OpportunityId",
                    "label": "Opportunity ID"
                },
                {
                    "expression": {
                        "sourceField": "StageName__c",
                        "default": null,
                        "offset": "current()"
                    },
                    "name": "StageName",
                    "label": "Stage Name"
                }
            ]
        }
    },

    "Extract_OpportunityHistory_default": {
        "schema": {
            "objects": [
                {
                    "label": "OpportunityHistory",
                    "fields": [
                        {
                            "format": "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'",
                            "name": "CreatedDate",
                            "description": "Opportunity Created Date",
                            "label": "CreatedDate"
                        },
                        {
                            "name": "Amount",
                            "description": "Amount",
                            "label": "Amount"
                        }
                    ]
                }
            ]
        },
        "action": "sfdcDigest",
        "parameters": {
            "fields": [
                {
                    "name": "Amount"
                },
                {
                    "fiscalMonthOffset": 0,
                    "name": "CloseDate"
                },
                {
                    "name": "CreatedById"
                },
                {
                    "fiscalMonthOffset": 0,
                    "name": "CreatedDate"
                },
                {
                    "name": "ForecastCategory"
                },
                {
                    "name": "Id"
                },
                {
                    "name": "IsDeleted"
                },
                {
                    "name": "OpportunityId"
                },
                {
                    "name": "StageName"
                }
            ],
            "complexFilterConditions": "CreatedDate >= 2016-02-25T20:00:00.000Z",
            "object": "OpportunityHistory"
        }
    },
    "computeTrending": {
        "action": "computeRelative",
        "parameters": {
            "partitionBy": [
                "OpportunityId"
            ],
            "orderBy": [
                {
                    "name": "CreatedDate",
                    "direction": "asc"
                }
            ],
            "source": "Extract_OpportunityHistory_default",
            "computedFields": [
                {
                    "expression": {
                        "sourceField": "CreatedDate",
                        "default": "current()",
                        "offset": "first()"
                    },
                    "name": "OpportunityCreatedDate",
                    "description": "Opportunity Created Date",
                    "label": "OpportunityCreatedDate"
                },
                {
                    "expression": {
                        "sourceField": "CreatedDate",
                        "default": "3000-01-01T00:00:00.000Z",
                        "offset": "next()"
                    },
                    "name": "ValidToDate",
                    "description": "ValidToDate",
                    "label": "ValidToDate"
                },
                {
                    "expression": {
                        "sourceField": "CreatedDate",
                        "default": "current()",
                        "offset": "current()"
                    },
                    "name": "ValidFromDate",
                    "description": "ValidFromDate",
                    "label": "ValidFromDate"
                },
                {
                    "expression": {
                        "sourceField": "Amount",
                        "default": "0",
                        "offset": "previous()"
                    },
                    "name": "AmountPrev",
                    "description": "AmountPrev",
                    "label": "AmountPrev"
                },
                {
                    "expression": {
                        "sourceField": "StageName",
                        "default": null,
                        "offset": "previous()"
                    },
                    "name": "StageNamePrev",
                    "description": "Previous Stage Name",
                    "label": "Prev Stage Name"
                },
                {
                    "expression": {
                        "sourceField": "ForecastCategory",
                        "default": null,
                        "offset": "previous()"
                    },
                    "name": "ForecastCategoryPrev",
                    "description": "ForecastCategoryPrev",
                    "label": "ForecastCategoryPrev"
                },
                {
                    "expression": {
                        "sourceField": "CloseDate",
                        "default": "1970-01-01",
                        "offset": "previous()"
                    },
                    "name": "CloseDatePrev",
                    "description": "Previous Close Date",
                    "label": "Prev Close Date"
                },
                {
                    "expression": {
                        "sourceField": "CreatedDate",
                        "default": null,
                        "offset": "previous()"
                    },
                    "name": "CreatedDatePrev",
                    "description": "Previous Created Date",
                    "label": "Prev CreatedDate"
                },

                {
                    "expression": {
                        "sourceField": "ForecastCategory",
                        "default": null,
                        "offset": "current()"
                    },
                    "name": "ForecastCategory__c",
                    "label": "To ForecastCategory__c"
                },
                {
                    "expression": {
                        "sourceField": "Amount",
                        "default": "0",
                        "offset": "current()"
                    },
                    "name": "Amount__c",
                    "label": "Amount__c"
                },
                {
                    "expression": {
                        "sourceField": "CloseDate",
                        "default": "current()",
                        "offset": "current()"
                    },
                    "name": "CloseDate__c",
                    "label": "Close Date__c"
                },
                {
                    "expression": {
                        "sourceField": "OpportunityId",
                        "default": "current()",
                        "offset": "current()"
                    },
                    "name": "OpportunityId__c",
                    "label": "Opportunity ID__c"
                },
                {
                    "expression": {
                        "sourceField": "StageName",
                        "default": null,
                        "offset": "current()"
                    },
                    "name": "StageName__c",
                    "label": "Stage Name__c"
                }
            ]
        }
    },

    "Extract_OpportunityHistory": {
        "action": "append",
        "parameters": {
            "sources": [
                "Extract_OpportunityHistory_custom",
                "Extract_OpportunityHistory_default"
            ]
        }
    }
}