open PaymentAnalyticsEntity
open HSAnalyticsUtils

let defaultColumns: array<DynamicSingleStat.columns<colT>> = [
  {
    sectionName: "",
    columns: [
      {
        colType: SuccessRate,
      },
    ],
  },
]

let getSingleStatEntity: 'a => DynamicSingleStat.entityType<'colType, 't, 't2> = metrics => {
  urlConfig: [
    {
      uri: `${Window.env.apiBaseUrl}/analytics/v1/metrics/${domain}`,
      metrics: metrics->getStringListFromArrayDict,
    },
  ],
  getObjects: itemToObjMapper,
  getTimeSeriesObject: timeSeriesObjMapper,
  defaultColumns,
  getData: getStatData,
  totalVolumeCol: None,
  matrixUriMapper: _ => `${Window.env.apiBaseUrl}/analytics/v1/metrics/${domain}`,
}
