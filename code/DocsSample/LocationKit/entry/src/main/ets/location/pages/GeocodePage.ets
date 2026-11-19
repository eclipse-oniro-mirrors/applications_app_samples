/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

// [Start geocode_import_module]
import { geoLocationManager } from '@kit.LocationKit';
// [End geocode_import_module]
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NavBar, SectionCard, LabelRow, LogArea, MAX_LOG_MESSAGES } from '../components/CommonComponents';

@Component
export struct GeocodePage {
  @Consume('pageInfos') pageInfos: NavPathStack;
  @State isGeocoderAvailable: boolean = false;
  @State geocoderQueried: boolean = false;
  @State reverseLatitude: string = '31.12';
  @State reverseLongitude: string = '121.11';
  @State reverseResults: geoLocationManager.GeoAddress[] = [];
  @State forwardDescription: string = '';
  @State forwardResults: geoLocationManager.GeoAddress[] = [];
  @State logMessages: string[] = [];

  aboutToAppear() {
    hilog.info(0x0000, '[Sample_LocationKit]', 'GeocodePage aboutToAppear');
  }

  addLog(msg: string) {
    this.logMessages = [`[${new Date().toLocaleTimeString()}] ${msg}`, ...this.logMessages].slice(0, MAX_LOG_MESSAGES);
  }

  // Compose a display line for a GeoAddress result
  describeAddress(address: geoLocationManager.GeoAddress): string {
    let parts: string[] = [];
    if (address.countryName) {
      parts.push(address.countryName);
    }
    if (address.administrativeArea) {
      parts.push(address.administrativeArea);
    }
    if (address.locality) {
      parts.push(address.locality);
    }
    if (address.subLocality) {
      parts.push(address.subLocality);
    }
    if (address.roadName) {
      parts.push(address.roadName);
    }
    if (parts.length === 0 && address.descriptions) {
      return address.descriptions.join(' / ');
    }
    return parts.join(' / ');
  }

  // Query whether the geocoder service is available
  checkGeocoderAvailability() {
    // [Start geocode_is_available]
    try {
      let isAvailable = geoLocationManager.isGeocoderAvailable();
      // [StartExclude geocode_is_available]
      this.isGeocoderAvailable = isAvailable;
      this.geocoderQueried = true;
      this.addLog(`isGeocoderAvailable: ${isAvailable}`);
      // [EndExclude geocode_is_available]
    } catch (err) {
      console.error('errCode:' + JSON.stringify(err));
      // [StartExclude geocode_is_available]
      this.addLog(`isGeocoderAvailable failed: ${JSON.stringify(err)}`);
      // [EndExclude geocode_is_available]
    }
    // [End geocode_is_available]
  }

  // Reverse geocoding: convert coordinates to a geographic description
  reverseGeocode() {
    let latitude: number = Number(this.reverseLatitude);
    let longitude: number = Number(this.reverseLongitude);
    if (Number.isNaN(latitude) || Number.isNaN(longitude)) {
      this.addLog('Invalid coordinate input');
      return;
    }
    // [Start geocode_reverse_geocode]
    let reverseGeocodeRequest: geoLocationManager.ReverseGeoCodeRequest =
      { 'latitude': latitude, 'longitude': longitude, 'maxItems': 1 };
    try {
      geoLocationManager.getAddressesFromLocation(reverseGeocodeRequest, (err, data) => {
        if (err) {
          console.error('getAddressesFromLocation err: ' + JSON.stringify(err));
        } else {
          console.info('getAddressesFromLocation data: ' + JSON.stringify(data));
        }
        // [StartExclude geocode_reverse_geocode]
        if (err) {
          this.addLog(`getAddressesFromLocation err: ${JSON.stringify(err)}`);
        } else {
          this.reverseResults = data;
          this.addLog(`getAddressesFromLocation got ${data.length} result(s)`);
        }
        // [EndExclude geocode_reverse_geocode]
      });
    } catch (err) {
      console.error('errCode:' + JSON.stringify(err));
      // [StartExclude geocode_reverse_geocode]
      this.addLog(`getAddressesFromLocation failed: ${JSON.stringify(err)}`);
      // [EndExclude geocode_reverse_geocode]
    }
    // [End geocode_reverse_geocode]
  }

  // Forward geocoding: convert a geographic description to coordinates
  forwardGeocode() {
    if (!this.forwardDescription) {
      this.addLog('Empty address description');
      return;
    }
    // [Start geocode_forward_geocode]
    let geocodeRequest: geoLocationManager.GeoCodeRequest =
      { 'description': this.forwardDescription, 'maxItems': 1 };
    try {
      geoLocationManager.getAddressesFromLocationName(geocodeRequest, (err, data) => {
        if (err) {
          console.error('getAddressesFromLocationName err: ' + JSON.stringify(err));
        } else {
          console.info('getAddressesFromLocationName data: ' + JSON.stringify(data));
        }
        // [StartExclude geocode_forward_geocode]
        if (err) {
          this.addLog(`getAddressesFromLocationName err: ${JSON.stringify(err)}`);
        } else {
          this.forwardResults = data;
          this.addLog(`getAddressesFromLocationName got ${data.length} result(s)`);
        }
        // [EndExclude geocode_forward_geocode]
      });
    } catch (err) {
      console.error('errCode:' + JSON.stringify(err));
      // [StartExclude geocode_forward_geocode]
      this.addLog(`getAddressesFromLocationName failed: ${JSON.stringify(err)}`);
      // [EndExclude geocode_forward_geocode]
    }
    // [End geocode_forward_geocode]
  }

  @Builder
  ReverseResultList() {
    if (this.reverseResults.length === 0) {
      Text($r('app.string.no_geocode_result'))
        .fontSize(14)
        .fontColor($r('app.color.text_disabled'))
        .margin({ bottom: 8 })
    } else {
      ForEach(this.reverseResults, (address: geoLocationManager.GeoAddress) => {
        Column() {
          LabelRow({ label: $r('app.string.label_latitude'), value: `${address.latitude}` })
          LabelRow({ label: $r('app.string.label_longitude'), value: `${address.longitude}` })
          Text(this.describeAddress(address))
            .fontSize(13)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
            .padding({ top: 4, bottom: 8 })
        }
        .width('100%')
        .borderRadius(8)
        .backgroundColor($r('app.color.bg_page'))
        .padding(12)
        .margin({ bottom: 8 })
      })
    }
  }

  @Builder
  ForwardResultList() {
    if (this.forwardResults.length === 0) {
      Text($r('app.string.no_geocode_result'))
        .fontSize(14)
        .fontColor($r('app.color.text_disabled'))
        .margin({ bottom: 8 })
    } else {
      ForEach(this.forwardResults, (address: geoLocationManager.GeoAddress) => {
        Column() {
          LabelRow({ label: $r('app.string.label_latitude'), value: `${address.latitude}` })
          LabelRow({ label: $r('app.string.label_longitude'), value: `${address.longitude}` })
          Text(this.describeAddress(address))
            .fontSize(13)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
            .padding({ top: 4, bottom: 8 })
        }
        .width('100%')
        .borderRadius(8)
        .backgroundColor($r('app.color.bg_page'))
        .padding(12)
        .margin({ bottom: 8 })
      })
    }
  }

  build() {
    Column() {
      NavBar({ title: $r('app.string.nav_geocode'), onBack: () => { this.pageInfos.pop(); } })

      Scroll() {
        Column() {
          SectionCard({}) {
            Text($r('app.string.geocode_description'))
              .fontSize(13)
              .fontColor($r('app.color.text_hint'))
              .width('100%')
          }

          SectionCard({ title: $r('app.string.section_geocoder_availability'), testId: 'section_geocoder_availability' }) {
            LabelRow({ label: $r('app.string.label_geocoder_state'),
              value: this.geocoderQueried ?
                (this.isGeocoderAvailable ? $r('app.string.status_enabled') : $r('app.string.status_disabled')) :
                $r('app.string.label_unknown') })
            Button($r('app.string.btn_check_availability'))
              .id('btn_check_availability')
              .width('100%')
              .margin({ top: 4 })
              .onClick(() => { this.checkGeocoderAvailability(); })
          }

          SectionCard({ title: $r('app.string.section_reverse_geocode'), testId: 'section_reverse_geocode' }) {
            TextInput({ text: this.reverseLatitude, placeholder: $r('app.string.placeholder_latitude') })
              .id('input_reverse_latitude')
              .type(InputType.NUMBER_DECIMAL)
              .height(44)
              .fontSize(14)
              .onChange((value: string) => { this.reverseLatitude = value; })
            TextInput({ text: this.reverseLongitude, placeholder: $r('app.string.placeholder_longitude') })
              .id('input_reverse_longitude')
              .type(InputType.NUMBER_DECIMAL)
              .height(44)
              .fontSize(14)
              .margin({ top: 8 })
              .onChange((value: string) => { this.reverseLongitude = value; })
            Button($r('app.string.btn_reverse_geocode'))
              .id('btn_reverse_geocode')
              .width('100%')
              .margin({ top: 8 })
              .onClick(() => { this.reverseGeocode(); })
            this.ReverseResultList()
          }

          SectionCard({ title: $r('app.string.section_forward_geocode'), testId: 'section_forward_geocode' }) {
            TextInput({ text: this.forwardDescription, placeholder: $r('app.string.placeholder_address_description') })
              .id('input_forward_description')
              .height(44)
              .fontSize(14)
              .onChange((value: string) => { this.forwardDescription = value; })
            Button($r('app.string.btn_forward_geocode'))
              .id('btn_forward_geocode')
              .width('100%')
              .margin({ top: 8 })
              .onClick(() => { this.forwardGeocode(); })
            this.ForwardResultList()
          }

          LogArea({ logMessages: this.logMessages })
        }
        .width('100%')
        .padding({ top: 12, left: 16, right: 16, bottom: 24 })
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg_page'))
  }
}
