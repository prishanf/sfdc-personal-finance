@isTest
public class BankTransactionDataLoaderCtrlTest {

   static testMethod void testSaveFile(){
        Blob base64String = Blob.valueof('T0ZYSEVBREVSOjEwMApEQVRBOk9GWFNHTUwKVkVSU0lPTjoxMDIKU0VDVVJJVFk6VFlQRTEKRU5DT0RJTkc6VVNBU0NJSQpDSEFSU0VUOjEyNTIKQ09NUFJFU1NJT046Tk9ORQpPTERGSUxFVUlEOk5PTkUKTkVXRklMRVVJRDpOT05FCgo8T0ZYPgogPFNJR05PTk1TR1NSU1YxPgogIDxTT05SUz4KICAgPFNUQVRVUz4KICAgIDxDT0RFPjAKICAgIDxTRVZFUklUWT5JTkZPCiAgICA8TUVTU0FHRT5PSwogICA8L1NUQVRVUz4KICAgPERUU0VSVkVSPjIwMTkwNzA2MDk1MDU1Wy03OlBTVF0KICAgPExBTkdVQUdFPkVORwogICA8SU5UVS5CSUQ+MDAwMjEKICA8L1NPTlJTPgogPC9TSUdOT05NU0dTUlNWMT4KIDxCQU5LTVNHU1JTVjE+CiAgPFNUTVRUUk5SUz4KICAgPFRSTlVJRD4xNTYyNDMxODU1MzcxCiAgIDxTVEFUVVM+CiAgICA8Q09ERT4wCiAgICA8U0VWRVJJVFk+SU5GTwogICAgPE1FU1NBR0U+T0sKICAgPC9TVEFUVVM+CiAgIDxTVE1UUlM+CiAgICA8Q1VSREVGPkNBRAogICAgPEJBTktBQ0NURlJPTT4KICAgICA8QkFOS0lEPjEzMDAwMDEwMAogICAgIDxCUkFOQ0hJRD4xMTkKICAgICA8QUNDVElEPlBDU3NseTcxVkRDMDExMTAxQwogICAgIDxBQ0NUVFlQRT5TQVZJTkdTCiAgICA8L0JBTktBQ0NURlJPTT4KICAgIDxCQU5LVFJBTkxJU1Q+CiAgICAgPERUU1RBUlQ+MjAxOTAxMDEwMDAwMDBbLTg6UFNUXQogICAgIDxEVEVORD4yMDE5MDEzMTIzNTk1OVstODpQU1RdCiAgICAgPFNUTVRUUk4+CiAgICAgIDxUUk5UWVBFPkRFQklUCiAgICAgIDxEVFBPU1RFRD4yMDE5MDEzMTAwMDAwMFstODpQU1RdCiAgICAgIDxUUk5BTVQ+LTEwLjk4CiAgICAgIDxGSVRJRD41MzAwMDAwMSAgICAgMTg2NTkwMzAzODYxNwogICAgICA8TkFNRT5QdXJjaGFzZQogICAgICA8TUVNTz5TQVZFIE9OIEZPT0RTIDkzOCAgICAgTUFQTEUgCiAgICAgPC9TVE1UVFJOPgogICAgIDxTVE1UVFJOPgogICAgICA8VFJOVFlQRT5DUkVESVQKICAgICAgPERUUE9TVEVEPjIwMTkwMTMxMDAwMDAwWy04OlBTVF0KICAgICAgPFRSTkFNVD43NzM1Ljk1CiAgICAgIDxGSVRJRD4xODAxMDAwMSAgICAgMTg2NTkwMDA4NjA4NwogICAgICA8TkFNRT5QYXlyb2xsIERlcG9zaXQKICAgICAgPE1FTU8+RkVSTkFORE8gV0FSTkFLVUxBU1VSSVlBIEdST1VORFNXRUxMIENMT1VEIFNPTFVUSU9OUwogICAgIDwvU1RNVFRSTj4KICAgICA8U1RNVFRSTj4KICAgICAgPFRSTlRZUEU+REVCSVQKICAgICAgPERUUE9TVEVEPjIwMTkwMTI5MDAwMDAwWy04OlBTVF0KICAgICAgPFRSTkFNVD4tNjcuNDcKICAgICAgPEZJVElEPjcxMDAwMDAxICAgICAxODY1NzA5MDEyNjAyCiAgICAgIDxOQU1FPlB1cmNoYXNlCiAgICAgIDxNRU1PPlJFQUwgQ0ROIFNVUEVSU1RPUkUgMSBNSVNTSU8gCiAgICAgPC9TVE1UVFJOPgogICAgIDxTVE1UVFJOPgogICAgICA8VFJOVFlQRT5ERUJJVAogICAgICA8RFRQT1NURUQ+MjAxOTAxMjkwMDAwMDBbLTg6UFNUXQogICAgICA8VFJOQU1UPi00OC44MQogICAgICA8RklUSUQ+NTIwMDAwMDEgICAgIDE4NjU2MDAzNDA3ODEKICAgICAgPE5BTUU+UHVyY2hhc2UKICAgICAgPE1FTU8+TkFHQU5PIEpBUEFORVNFIFJFU1RBVSBDT1FVSSAKICAgICA8L1NUTVRUUk4+CiAgICAgPFNUTVRUUk4+CiAgICAgIDxUUk5UWVBFPkRFQklUCiAgICAgIDxEVFBPU1RFRD4yMDE5MDEyODAwMDAwMFstODpQU1RdCiAgICAgIDxUUk5BTVQ+LTY1LjM2CiAgICAgIDxGSVRJRD4xNTAwMDAwMSAgICAgMTg2NTYwMDc5ODQ1OAogICAgICA8TkFNRT5QdXJjaGFzZQogICAgICA8TUVNTz5DT1NUQ08gR0FTIFcxNjMgICAgICAgIEFCQk9UIAogICAgIDwvU1RNVFRSTj4KICAgICA8U1RNVFRSTj4KICAgICAgPFRSTlRZUEU+REVCSVQKICAgICAgPERUUE9TVEVEPjIwMTkwMTIyMDAwMDAwWy04OlBTVF0KICAgICAgPFRSTkFNVD4tMTQxLjY1CiAgICAgIDxGSVRJRD4wODAwMDAwMSAgICAgMTg2NTAwOTU0ODM0NQogICAgICA8TkFNRT5QcmUtQXV0aCBEZWJpdAogICAgICA8TUVNTz5XQVJOQUtVTEFTVVJJWUEgRkVSTkFORE8gRWRnZSBCZW5lZnRpcwogICAgIDwvU1RNVFRSTj4KICAgICA8U1RNVFRSTj4KICAgICAgPFRSTlRZUEU+REVCSVQKICAgICAgPERUUE9TVEVEPjIwMTkwMTIxMDAwMDAwWy04OlBTVF0KICAgICAgPFRSTkFNVD4tMjUwMC4wMAogICAgICA8RklUSUQ+MjIwMTAwMDEgICAgIDE4NjQ5MDI3NjQyMzkKICAgICAgPE5BTUU+T25saW5lIFRyYW5zZmVyIE91dAogICAgICA8TUVNTz4xNTBLIExDIHBheW1lbnQgCiAgICAgPC9TVE1UVFJOPgogICAgIDxTVE1UVFJOPgogICAgICA8VFJOVFlQRT5ERUJJVAogICAgICA8RFRQT1NURUQ+MjAxOTAxMTkwMDAwMDBbLTg6UFNUXQogICAgICA8VFJOQU1UPi0yOC4zMQogICAgICA8RklUSUQ+NTkwMDAwMDEgICAgIDE4NjQ3MDgwNDYyOTkKICAgICAgPE5BTUU+UHVyY2hhc2UKICAgICAgPE1FTU8+V0FMLU1BUlQgMTIwNiAgICAgICAgIE1BUExFIAogICAgIDwvU1RNVFRSTj4KICAgICA8U1RNVFRSTj4KICAgICAgPFRSTlRZUEU+REVCSVQKICAgICAgPERUUE9TVEVEPjIwMTkwMTE4MDAwMDAwWy04OlBTVF0KICAgICAgPFRSTkFNVD4tNS41MwogICAgICA8RklUSUQ+NDgwMTAwMDEgICAgIDE4NjQ2MDA0MTI3OTgKICAgICAgPE5BTUU+RXh0cmEgUGF5bWVudAogICAgIDwvU1RNVFRSTj4KICAgICA8U1RNVFRSTj4KICAgICAgPFRSTlRZUEU+REVCSVQKICAgICAgPERUUE9TVEVEPjIwMTkwMTE4MDAwMDAwWy04OlBTVF0KICAgICAgPFRSTkFNVD4tMzQ0LjQ3CiAgICAgIDxGSVRJRD44NTA1MDAwMSAgICAgMTg2NDYwNjEwODc1OAogICAgICA8TkFNRT5QYXltZW50CiAgICAgPC9TVE1UVFJOPgogICAgIDxTVE1UVFJOPgogICAgICA8VFJOVFlQRT5ERUJJVAogICAgICA8RFRQT1NURUQ+MjAxOTAxMTgwMDAwMDBbLTg6UFNUXQogICAgICA8VFJOQU1UPi0xNC42OAogICAgICA8RklUSUQ+NzYwMDAwMDEgICAgIDE4NjQ2MDA4Nzg1OTIKICAgICAgPE5BTUU+UHVyY2hhc2UKICAgICAgPE1FTU8+QU1KIFBJWlpBIEFORCBNRUFUIFNITyBNSVNTSSAKICAgICA8L1NUTVRUUk4+CiAgICAgPFNUTVRUUk4+CiAgICAgIDxUUk5UWVBFPkRFQklUCiAgICAgIDxEVFBPU1RFRD4yMDE5MDExODAwMDAwMFstODpQU1RdCiAgICAgIDxUUk5BTVQ+LTE2Ljk3CiAgICAgIDxGSVRJRD4xNDAwMDAwMSAgICAgMTg2NDYwMjc5MzU4OAogICAgICA8TkFNRT5QdXJjaGFzZQogICAgICA8TUVNTz5GUlVJVFMgQU5EIEdSRUVOUyAgICAgIE1JU1NJIAogICAgIDwvU1RNVFRSTj4KICAgICA8U1RNVFRSTj4KICAgICAgPFRSTlRZUEU+Q1JFRElUCiAgICAgIDxEVFBPU1RFRD4yMDE5MDExODAwMDAwMFstODpQU1RdCiAgICAgIDxUUk5BTVQ+MjE5LjA5CiAgICAgIDxGSVRJRD44ODAwMDAwMSAgICAgMTg2NDYwMTMyOTA4MgogICAgICA8TkFNRT5EaXJlY3QgRGVwb3NpdAogICAgICA8TUVNTz5CSEFTSElOSUUgSCBQQUxMSVlBR1VSVSBDQU5BREEKICAgICA8L1NUTVRUUk4+CiAgICAgPFNUTVRUUk4+CiAgICAgIDxUUk5UWVBFPkRFQklUCiAgICAgIDxEVFBPU1RFRD4yMDE5MDExNjAwMDAwMFstODpQU1RdCiAgICAgIDxUUk5BTVQ+LTY5MC4wMAogICAgICA8RklUSUQ+ODUwNDAwMDEgICAgIDE4NjQzMDM1ODY4NTcKICAgICAgPE5BTUU+RGViaXQKICAgICAgPE1FTU8+QXB0IExDIGludHJlc3QgQ2FwaXRhbCBwYXltZSAKICAgICA8L1NUTVRUUk4+CiAgICAgPFNUTVRUUk4+CiAgICAgIDxUUk5UWVBFPkRFQklUCiAgICAgIDxEVFBPU1RFRD4yMDE5MDExNTAwMDAwMFstODpQU1RdCiAgICAgIDxUUk5BTVQ+LTM3Ljg3CiAgICAgIDxGSVRJRD41MjAwMDAwMSAgICAgMTg2NDMwMzIwODQxOAogICAgICA8TkFNRT5QdXJjaGFzZQogICAgICA8TUVNTz5DT1NUQ08gV0hPTEVTQUxFIFcxNjMgIEFCQk9UIAogICAgIDwvU1RNVFRSTj4KICAgICA8U1RNVFRSTj4KICAgICAgPFRSTlRZUEU+REVCSVQKICAgICAgPERUUE9TVEVEPjIwMTkwMTE1MDAwMDAwWy04OlBTVF0KICAgICAgPFRSTkFNVD4tNTkuODAKICAgICAgPEZJVElEPjczMDAwMDAxICAgICAxODY0MzA0Mjk5NDA5CiAgICAgIDxOQU1FPlB1cmNoYXNlCiAgICAgIDxNRU1PPkNPU1RDTyBHQVMgVzE2MyAgICAgICAgQUJCT1QgCiAgICAgPC9TVE1UVFJOPgogICAgIDxTVE1UVFJOPgogICAgICA8VFJOVFlQRT5DUkVESVQKICAgICAgPERUUE9TVEVEPjIwMTkwMTE1MDAwMDAwWy04OlBTVF0KICAgICAgPFRSTkFNVD4zOTY1Ljg2CiAgICAgIDxGSVRJRD4zNTAyMDAwMSAgICAgMTg2NDMwMzczMzA4MwogICAgICA8TkFNRT5QYXlyb2xsIERlcG9zaXQKICAgICAgPE1FTU8+RkVSTkFORE8gV0FSTkFLVUxBU1VSSVlBIEdST1VORFNXRUxMIENMT1VEIFNPTFVUSU9OUwogICAgIDwvU1RNVFRSTj4KICAgICA8U1RNVFRSTj4KICAgICAgPFRSTlRZUEU+REVCSVQKICAgICAgPERUUE9TVEVEPjIwMTkwMTE0MDAwMDAwWy04OlBTVF0KICAgICAgPFRSTkFNVD4tMTM4LjE2CiAgICAgIDxGSVRJRD4yNTAwMDAwMSAgICAgMTg2NDIwMjk4NTY0MAogICAgICA8TkFNRT5QdXJjaGFzZQogICAgICA8TUVNTz5SRUFMIENETiBTVVBFUlNUT1JFIDEgTUlTU0lPIAogICAgIDwvU1RNVFRSTj4KICAgICA8U1RNVFRSTj4KICAgICAgPFRSTlRZUEU+REVCSVQKICAgICAgPERUUE9TVEVEPjIwMTkwMTEyMDAwMDAwWy04OlBTVF0KICAgICAgPFRSTkFNVD4tNDAuMDAKICAgICAgPEZJVElEPjcxMDAwMDAxICAgICAxODY0MDA2MzUzNTc4CiAgICAgIDxOQU1FPkFUTSBXZHJsCiAgICAgIDxNRU1PPjIyNDE1IExPVUdIRUVEIEhJR0hXQVkgTUFQTEUgCiAgICAgPC9TVE1UVFJOPgogICAgIDxTVE1UVFJOPgogICAgICA8VFJOVFlQRT5ERUJJVAogICAgICA8RFRQT1NURUQ+MjAxOTAxMDcwMDAwMDBbLTg6UFNUXQogICAgICA8VFJOQU1UPi0xNDEuNjUKICAgICAgPEZJVElEPjU0MDIwMDAxICAgICAxODYzNTA3MDY4MzQ5CiAgICAgIDxOQU1FPlByZS1BdXRoIERlYml0CiAgICAgIDxNRU1PPldBUk5BS1VMQVNVUklZQSBGRVJOQU5ETyBFZGdlIEJlbmVmdGlzCiAgICAgPC9TVE1UVFJOPgogICAgIDxTVE1UVFJOPgogICAgICA8VFJOVFlQRT5ERUJJVAogICAgICA8RFRQT1NURUQ+MjAxOTAxMDQwMDAwMDBbLTg6UFNUXQogICAgICA8VFJOQU1UPi01LjUzCiAgICAgIDxGSVRJRD41NTAxMDAwMSAgICAgMTg2MzIwMjg3MTc5NwogICAgICA8TkFNRT5FeHRyYSBQYXltZW50CiAgICAgPC9TVE1UVFJOPgogICAgIDxTVE1UVFJOPgogICAgICA8VFJOVFlQRT5ERUJJVAogICAgICA8RFRQT1NURUQ+MjAxOTAxMDQwMDAwMDBbLTg6UFNUXQogICAgICA8VFJOQU1UPi0zNDQuNDcKICAgICAgPEZJVElEPjI2MDcwMDAxICAgICAxODYzMjAxNjQzNzU4CiAgICAgIDxOQU1FPlBheW1lbnQKICAgICA8L1NUTVRUUk4+CiAgICAgPFNUTVRUUk4+CiAgICAgIDxUUk5UWVBFPkRFQklUCiAgICAgIDxEVFBPU1RFRD4yMDE5MDEwMjAwMDAwMFstODpQU1RdCiAgICAgIDxUUk5BTVQ+LTE4MC40NQogICAgICA8RklUSUQ+NjUwMDAwMDEgICAgIDE4NjMwMDMwMTIzNTMKICAgICAgPE5BTUU+UHJlLUF1dGggRGViaXQKICAgICAgPE1FTU8+V0FSTkFLVUxBU1VSSVlBIEZFUk5BTkRPIEFORCBDTyBPUCBMSUZFIFZJRQogICAgIDwvU1RNVFRSTj4KICAgICA8U1RNVFRSTj4KICAgICAgPFRSTlRZUEU+REVCSVQKICAgICAgPERUUE9TVEVEPjIwMTkwMTAxMDAwMDAwWy04OlBTVF0KICAgICAgPFRSTkFNVD4tMjU3LjY4CiAgICAgIDxGSVRJRD40NDA0MDAwMSAgICAgMTg2MjkwMzcyNzc0NAogICAgICA8TkFNRT5PbmxpbmUgQmlsbCBQYXltZW50CiAgICAgIDxNRU1PPkFzc29jaWEgQnJpdGlzaCBDb2x1bWJpYSBJbmMgIENvbmZpcm1hdGlvbiAjNjAzODQ0ICAgICAgIAogICAgIDwvU1RNVFRSTj4KICAgIDwvQkFOS1RSQU5MSVNUPgogICAgPExFREdFUkJBTD4KICAgICA8QkFMQU1UPjg2MTguMzcKICAgICA8RFRBU09GPjIwMTkwMTMxMjM1OTU5Wy04OlBTVF0KICAgIDwvTEVER0VSQkFMPgogICA8L1NUTVRSUz4KICA8L1NUTVRUUk5SUz4KIDwvQkFOS01TR1NSU1YxPgo8L09GWD4=');

        String fileData = EncodingUtil.urlEncode(base64String.toString(), 'UTF-8');

        List<Map<String,String>> result = BankTransactionDataLoaderCtrl.saveFile(fileData);
        System.assertEquals(24, result.size());
    }

}