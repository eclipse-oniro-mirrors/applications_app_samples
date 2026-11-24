/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { resourceManager } from '@kit.LocalizationKit';
import { ResourceAccessService } from '../service/ResourceAccessService';

/** Quantity passed to the plural resource, keeps the "other" branch. */
const SPECIFIED_NUM: number = 2;
/** Density requested for the density specific media sample. */
const SPECIFIED_DENSITY: number = 640;
const APP_BUNDLE_NAME: string = 'ohos.samples.resourcemanager';
const APP_MODULE_NAME: string = 'entry';

@Entry
@Component
struct Index {
  private service: ResourceAccessService = new ResourceAccessService(getContext().resourceManager);
  @State string_str: string = 'string'
  @State strArray: string = 'stringArray'
  @State plural: string = 'plural'
  @State configuration: string = 'configuration'
  @State capability: string = 'capability'
  @State media: string = 'media'
  @State mediaBase: string = 'mediaBase'
  @State formatStr: string = 'Format String'
  @State densityMedia: string = 'Density Media'
  @State systemRes: string = 'System Res'

  async aboutToAppear() {
    this.string_str = await this.service.getString($r('app.string.string_str').id);
    let resource: resourceManager.Resource = {
      bundleName: APP_BUNDLE_NAME,
      moduleName: APP_MODULE_NAME,
      id: $r('app.strarray.str_array').id
    }
    this.strArray = JSON.stringify(await this.service.getStringArray(resource));
    this.plural = await this.service.getPluralString($r('app.plural.eat_apple').id, SPECIFIED_NUM);
    this.configuration = await this.service.getConfigurationJson();
    this.capability = await this.service.getCapabilityJson();
    this.media = String(await this.service.getMediaByteLength($r('app.media.app_icon').id));
    this.mediaBase = String(await this.service.getMediaBase64Length($r('app.media.app_icon').id));
    this.formatStr = this.service.formatString($r('app.string.formatStr').id,
      await this.service.getString($r('app.string.world').id));
    this.densityMedia = await this.service.getDensityMediaBase64($r('app.media.density').id, SPECIFIED_DENSITY);
    this.systemRes = await this.service.getSystemMediaBase64($r('sys.media.ohos_app_icon').id);
  }

  build() {
    Column() {
      Text($r('app.string.title'))
        .id('basicResourcesTitle')
        .width('100%')
        .height(50)
        .backgroundColor($r('app.color.text_color'))
        .fontColor(Color.White)
        .fontSize(20)
        .padding({ left: 15 })
      Scroll() {
        Column() {
          Text($r('app.string.stringDesc'))
            .fontSize(25)

          Text(this.string_str)
            .id('stringValue')
            .fontSize(25)
            .fontColor('#ffff0000')
            .fontWeight(FontWeight.Bold)

          Text($r('app.string.stringArrayDesc'))
            .fontSize(25)

          Text(this.strArray)
            .id('stringArrayValue')
            .fontSize(25)
            .fontColor('#ffff0000')
            .fontWeight(FontWeight.Bold)

          Text($r('app.string.pluralStringDesc'))
            .fontSize(25)

          Text(this.plural)
            .id('pluralValue')
            .fontSize(25)
            .fontColor('#ffff0000')
            .fontWeight(FontWeight.Bold)

          Text($r('app.string.configurationDesc'))
            .fontSize(25)

          Text(this.configuration)
            .id('configurationValue')
            .fontSize(25)
            .fontColor('#ffff0000')
            .fontWeight(FontWeight.Bold)

          Text($r('app.string.capabilityDesc'))
            .fontSize(25)

          Text(this.capability)
            .id('capabilityValue')
            .fontSize(25)
            .fontColor('#ffff0000')
            .fontWeight(FontWeight.Bold)

          Text($r('app.string.mediaDesc'))
            .fontSize(25)

          Text(this.media)
            .id('mediaValue')
            .fontSize(25)
            .fontColor('#ffff0000')
            .fontWeight(FontWeight.Bold)

          Text($r('app.string.mediaBase64Desc'))
            .fontSize(25)

          Text(this.mediaBase)
            .id('mediaBase64Value')
            .fontSize(25)
            .fontColor('#ffff0000')
            .fontWeight(FontWeight.Bold)

          Text($r('app.string.formatStrDesc'))
            .fontSize(25)

          Text(this.formatStr)
            .id('formatStringValue')
            .fontSize(25)
            .fontColor('#ffff0000')
            .fontWeight(FontWeight.Bold)

          Text($r('app.string.densityMediaDesc'))
            .fontSize(25)

          Image(this.densityMedia)
            .id('getDensityMedia')
            .height('10%')

          Text($r('app.string.systemResDesc'))
            .fontSize(25)

          Image(this.systemRes)
            .id('getSystemMedia')
            .height('10%')
        }
        .width('100%')
        .padding(10)
        .alignItems(HorizontalAlign.Start)
      }
    }
    .width('100%')
    .height('100%')
  }
}
