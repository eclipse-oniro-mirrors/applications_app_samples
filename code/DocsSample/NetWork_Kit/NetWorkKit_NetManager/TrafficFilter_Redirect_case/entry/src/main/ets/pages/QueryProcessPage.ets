/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { router } from '@kit.ArkUI'
import { hilog } from '@kit.PerformanceAnalysisKit'
import { BusinessError } from '@kit.BasicServicesKit'
import trafficFilterSdk from 'libentry.so'

interface ProcessInfoResult {
  status: string
  pid?: number
  uid?: number
  processName?: string
  code?: number
  message?: string
}

@Entry
@Component
struct QueryProcessPage {
  @State srcIp: string = ''
  @State srcPort: number = 0
  @State dstIp: string = ''
  @State dstPort: number = 0
  @State protocol: number = 6
  @State outputContent: string = ''

  readonly protocolOptions: Array<SelectOption> = [
    { value: 'TCP' },
    { value: 'UDP' }
  ]

  build() {
    Column() {
      Row() {
        Button('<').fontSize(20).fontColor('#000000').backgroundColor('#FFFFFF')
          .onClick(() => router.back())
        Text('Query Process Demo')
          .fontSize(24)
          .fontWeight(500)
          .fontColor('#000000')
          .margin({ left: 20 })
      }
      .width('100%')
      .height(50)
      .padding({ left: 16, right: 16 })

      Divider().color('gray').strokeWidth(1)

      Scroll() {
        Column({ space: 15 }) {
          this.SectionTitle('Connection Information')

          Column({ space: 10 }) {
            Text('Source IP Address').fontSize(14).fontColor('#666666')
            TextInput({ placeholder: 'e.g., 192.168.1.1', text: this.srcIp })
              .width('100%')
              .onChange((value: string) => {
                this.srcIp = value.trim()
              })
          }

          Row({ space: 15 }) {
            Column({ space: 5 }) {
              Text('Source Port').fontSize(14).fontColor('#666666')
              TextInput({ text: this.srcPort.toString() })
                .type(InputType.Number)
                .width('48%')
                .onChange((value: string) => {
                  this.srcPort = parseInt(value) || 0
                })
            }

            Column({ space: 5 }) {
              Text('Protocol').fontSize(14).fontColor('#666666')
              Select(this.protocolOptions)
                .selected(this.protocol - 6)
                .width('48%')
                .onSelect((index: number) => {
                  this.protocol = index === 0 ? 6 : 17
                })
            }
          }

          Divider().color('gray').strokeWidth(1)

          Column({ space: 10 }) {
            Text('Destination IP Address').fontSize(14).fontColor('#666666')
            TextInput({ placeholder: 'e.g., 8.8.8.8', text: this.dstIp })
              .width('100%')
              .onChange((value: string) => {
                this.dstIp = value.trim()
              })
          }

          Column({ space: 10 }) {
            Text('Destination Port').fontSize(14).fontColor('#666666')
            TextInput({ text: this.dstPort.toString() })
              .type(InputType.Number)
              .width('100%')
              .onChange((value: string) => {
                this.dstPort = parseInt(value) || 0
              })
          }

          Button('Query Process')
            .fontSize(16)
            .fontColor('#FFFFFF')
            .backgroundColor('#007DFF')
            .margin({ top: 10 })
            .onClick(this.handleQueryProcess)

          Divider().color('gray').strokeWidth(1)

          this.SectionTitle('Query Results')

          TextArea({ text: this.outputContent })
            .width('100%')
            .height(150)
            .backgroundColor('#F5F5F5')
            .fontColor('#000000')
            .fontSize(14)
            .borderRadius(8)
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 15 })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
      .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }

  @Builder
  SectionTitle(title: string) {
    Text(title)
      .fontSize(18)
      .fontWeight(600)
      .fontColor('#000000')
  }

  private handleQueryProcess = async () => {
    const srcIpToUse = this.srcIp || '0.0.0.0'
    const dstIpToUse = this.dstIp || '0.0.0.0'

    hilog.info(
      0x0000,
      'QueryProcess',
      'Calling queryProcess with srcIp=%{public}s, srcPort=%{public}d, ' +
        'dstIp=%{public}s, dstPort=%{public}d, protocol=%{public}d',
      srcIpToUse,
      this.srcPort,
      dstIpToUse,
      this.dstPort,
      this.protocol
    )

    try {
      const result: string = trafficFilterSdk.queryProcess(
        srcIpToUse,
        this.srcPort,
        dstIpToUse,
        this.dstPort,
        this.protocol
      )

      this.outputContent = result
      hilog.info(0x0000, 'QueryProcess', 'Query result: %{public}s', result)

      try {
        const parsed: ProcessInfoResult = JSON.parse(result)
        if (parsed.status === 'SUCCESS') {
          hilog.info(0x0000, 'QueryProcess', 'Process found: pid=%{public}d, uid=%{public}d',
            parsed.pid, parsed.uid)
        } else {
          hilog.warn(0x0000, 'QueryProcess', 'Query failed: %{public}s', parsed.message)
        }
      } catch (e) {
        hilog.warn(0x0000, 'QueryProcess', 'Failed to parse result JSON')
      }
    } catch (err) {
      const e: BusinessError = err as BusinessError
      const errorMsg = `ERROR: ${e.message}`
      this.outputContent = errorMsg
      hilog.error(0x0000, 'QueryProcess', 'QueryProcess error: %{public}s', e.message)
    }
  }
}
