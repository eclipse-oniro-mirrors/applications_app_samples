/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import FormDate from '../model/FormDate'
import MenuData from '../model/MenuData'
import { AirData, AirIndex, City, CityListData, Forecast, HeaderData, WeekWeather, SuitData } from '../model/Main'
import { cityData } from '../mock/CityInfo'
import { weather } from '../mock/Mock'
import {
  MenuLabel,
  MenuUrl,
  MockConstants,
  RouteConstants,
  StorageKeys,
  UpdateInterval,
  WeatherSymbol,
  WeatherType
} from '../util/Constants'

const form = new FormDate() // 时间格式修正

// 获取天气类型对应的icon
function getTypeIcon(data: string): Resource {
  switch (data) {
    case WeatherType.SUNNY:
      return $r('app.media.ic_weather_sunny')
    case WeatherType.CLOUDY:
      return $r('app.media.ic_weather_cloudy')
    case WeatherType.OVERCAST:
      return $r('app.media.ic_weather_yin')
    case WeatherType.LIGHT_RAIN:
      return $r('app.media.ic_weather_lightrain')
    case WeatherType.THUNDER_SHOWER:
      return $r('app.media.ic_weather_lightrain')
    case WeatherType.SUNSET:
      return $r('app.media.ic_weather_sunset')
    case WeatherType.MODERATE_RAIN:
      return $r('app.media.ic_weather_rain')
    case WeatherType.HEAVY_RAIN:
      return $r('app.media.ic_weather_rain')
    default:
      return $r('app.media.ic_weather_cloudy')
  }
}

function getUpdateTimes() {
  const times: string[] = [
    UpdateInterval.ONE_HOUR,
    UpdateInterval.TWO_HOURS,
    UpdateInterval.FOUR_HOURS,
    UpdateInterval.SIX_HOURS,
    UpdateInterval.TWELVE_HOURS,
    UpdateInterval.ONE_DAY,
    UpdateInterval.NEVER
  ]
  return times
}

function getMenuInfo() {
  const data: MenuData[] =
    [
      new MenuData(MenuLabel.MANAGE_CITY, RouteConstants.CITY_LIST),
      new MenuData(MenuLabel.UPDATE_INTERVAL, MenuUrl.NONE)
    ]
  return data
}

// 获取首页顶部显示信息
function getHeaderDate(cityIndex: number, city?: City) {
  // 生成空气质量对象
  const air: AirData = {
    airQuality: weather[cityIndex].aqi.air,
    airDesc: weather[cityIndex].aqi.air_level
  }
  const today = weather[cityIndex].data[MockConstants.TODAY_INDEX]
  return new HeaderData(city ? city.name : weather[cityIndex].city, today.tem, today.wea, today.tem1, today.tem2,
    getTypeIcon(today.wea), air, today.air_tips)
}

function getCityList() {
  let cities: Array<City> = []
  if (cityData) {
    cityData.forEach(item => {
      cities.push(new City(item.name, item.temp, item.weather))
    })
  }
  return cities
}

function addCity(city: City) {
  let cities: City[] = AppStorage.get(StorageKeys.CITY_LIST)
  const cityIndex: number = cities.length % MockConstants.WEATHER_CYCLE
  city.weather = weather[cityIndex].data[MockConstants.TODAY_INDEX].wea
  city.temp = weather[cityIndex].data[MockConstants.TODAY_INDEX].tem
  cities.push(city)
  AppStorage.setOrCreate(StorageKeys.CITY_LIST, cities)
}

function getCityListWeatherData() {
  const cityListWeatherData: CityListData[] = []
  // 生成空气质量对象
  let cities: City[] = AppStorage.get(StorageKeys.CITY_LIST)
  if (cities === undefined || cities.length === 0) {
    cities = getCityList().splice(0, MockConstants.DEFAULT_CITY_COUNT)
    AppStorage.setOrCreate(StorageKeys.CITY_LIST, cities)
  }
  const titles: string[] = []
  if (cities) {
    cities.forEach((item, cityIndex) => {
      const index: number = cityIndex % MockConstants.WEATHER_CYCLE
      const air: AirData = { airQuality: weather[index].aqi.air, airDesc: weather[index].aqi.air_level }
      cityListWeatherData.push(new CityListData(item.name, getHeaderDate(index, item), getHoursData(index),
        getWeekWeatherData(index), air, getAirIndexData(index), getLifeData(index)))
      titles.push('')
    })
  }
  AppStorage.setOrCreate(StorageKeys.TITLE_TEXT, titles)
  return cityListWeatherData
}

// 获取逐小时天气情况
function getHoursData(cityIndex: number) {
  const hoursData: Forecast[] = []
  weather[cityIndex].data[MockConstants.TODAY_INDEX].hours.forEach(item => {
    const time: string = item.hours.substring(0, item.hours.length - MockConstants.HOUR_UNIT_LENGTH)
    hoursData.push(new Forecast(`${item.tem}${WeatherSymbol.DEGREE}`, `${time}:00`, form.formTimeSlot(parseInt(time)),
      getTypeIcon(item.wea), item.win, item.win_speed))
    if (item.hours.indexOf(String(MockConstants.SUNSET_HOUR)) !== -1) {
      hoursData.push(new Forecast(WeatherType.SUNSET, MockConstants.SUNSET_TIME, form.formTimeSlot(parseInt(time)),
        getTypeIcon(WeatherType.SUNSET), item.win, item.win_speed))
    }
  })
  return hoursData
}

// 获取一周天气情况 根据获取到的数据格式化成需要的样式
function getWeekWeatherData(cityIndex: number) {
  const weekData: WeekWeather[] = []
  weather[cityIndex].data.forEach(item => {
    weekData.push(new WeekWeather(form.formMonthDay(item.date), item.week, getTypeIcon(item.wea), item.wea,
      item.air_level, item.tem1, item.tem2))
  })
  return weekData
}

// 空气质量原始数据结构，mock 数据中各指标以字符串形式给出
interface AqiData {
  pm25: string
  pm10: string
  o3: string
  no2: string
  so2: string
  co: string
}

// 获取首页空气质量部分 右侧数据
function getAirIndexData(cityIndex: number) {
  const aqi: AqiData = weather[cityIndex].aqi
  // mock 数据中指标为字符串，AirIndex.figure 同时接受 string 与 number，此处保持原值
  const indexDate: AirIndex[] = [
    new AirIndex('PM10', aqi.pm10),
    new AirIndex('PM2.5', aqi.pm25),
    new AirIndex('NO2', aqi.no2),
    new AirIndex('SO2', aqi.so2),
    new AirIndex('O2', aqi.o3),
    new AirIndex('CO', aqi.co)
  ]
  return indexDate
}

// 获取生活指数 下方数据
function getLifeData(cityIndex: number) {
  const suitDate: SuitData[] = []
  const iconList: Resource[] = [
    $r('app.media.icon_humidity'),
    $r('app.media.icon_cloth'),
    $r('app.media.icon_temperature'),
    $r('app.media.icon_sport'),
    $r('app.media.icon_breeze'),
    $r('app.media.icon_cold'),
    $r('app.media.icon_southerly'),
    $r('app.media.icon_uv')
  ]
  weather[cityIndex].data[MockConstants.TODAY_INDEX].index.forEach((item, index) => {
    suitDate.push(new SuitData(iconList[index], item.title, item.level))
  })
  return suitDate
}

// 根据天气类型 获取背景图片
function getSideBg(weatherType: string): Resource {
  if (weatherType === WeatherType.SUNNY) {
    return $r('app.media.weather_fine')
  } else if (weatherType.includes(WeatherType.RAIN)) {
    return $r('app.media.weather_rain')
  } else {
    return $r('app.media.weather_yin')
  }
}

// 根据天气类型 获取背景图片
function getBg(weatherType: string): Resource {
  if (weatherType === WeatherType.SUNNY) {
    return $r('app.media.sunny_bg')
  } else if (weatherType.includes(WeatherType.RAIN)) {
    return $r('app.media.rain_bg')
  } else {
    return $r('app.media.yin_bg')
  }
}

export {
  getUpdateTimes,
  getMenuInfo,
  getHeaderDate,
  getCityList,
  addCity,
  getCityListWeatherData,
  getHoursData,
  getWeekWeatherData,
  getAirIndexData,
  getLifeData,
  getSideBg,
  getBg
}