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

import { hilog } from '@kit.PerformanceAnalysisKit';
import testNapi from 'libentry.so';
import { AffinityReport, CpuTopology, ResetAffinityReport } from 'libentry.so';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NdkQosDevice]';
const INVALID_RESULT: number = -1;

@Entry
@Component
struct DeviceInfoPage {
  @State cpuCount: number = 0;
  @State selectedCpu: number = INVALID_RESULT;
  @State affinityCpus: number[] = [];
  @State bindCpu: number = INVALID_RESULT;
  @State bindResult: number = INVALID_RESULT;
  @State busy: boolean = false;
  @State statusText: Resource = $r('app.string.device_status_idle');

  private applyTopology(topology: CpuTopology): void {
    this.cpuCount = topology.cpuCount;
    this.selectedCpu = topology.selectedCpu;
    this.affinityCpus = topology.affinityCpus;
    if (this.bindCpu < 0 && topology.cpuCount > 0) {
      this.bindCpu = topology.selectedCpu;
    }
  }

  private refreshTopology(): void {
    const topology: CpuTopology = testNapi.getCpuTopology();
    this.applyTopology(topology);
    this.statusText = topology.code === 0 ? $r('app.string.device_status_done') : $r('app.string.device_status_failed');
  }

  private bindSelectedCpu(): void {
    const report: AffinityReport = testNapi.bindCurrentThread(this.bindCpu);
    this.bindResult = report.bindResult;
    this.affinityCpus = report.affinityCpus;
    this.statusText = report.code === 0 ? $r('app.string.device_status_bound') : $r('app.string.device_status_failed');
  }

  private resetAffinity(): void {
    const report: ResetAffinityReport = testNapi.resetThreadAffinity();
    this.bindResult = report.bindResult;
    this.affinityCpus = report.affinityCpus;
    this.statusText = report.code === 0 ? $r('app.string.device_status_reset') : $r('app.string.device_status_failed');
  }

  private affinityText(): string {
    if (this.affinityCpus.length === 0) {
      return '-';
    }
    let text: string = '';
    for (let index = 0; index < this.affinityCpus.length; index++) {
      text += (index === 0 ? '' : ', ') + this.affinityCpus[index].toString();
    }
    return text;
  }

  private cpuOptions(): number[] {
    const options: number[] = [];
    for (let cpu = 0; cpu < this.cpuCount; cpu++) {
      options.push(cpu);
    }
    return options;
  }

  build() {
    Column({ space: 10 }) {
      Row({ space: 10 }) {
        Button($r('app.string.common_back'), { type: ButtonType.Normal })
          .height(36)
          .borderRadius(8)
          .backgroundColor($r('app.color.qos_button_bg'))
          .fontColor($r('app.color.qos_text_primary'))
          .onClick(() => {
            this.getUIContext().getRouter().back();
          })
        Text($r('app.string.device_title'))
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.qos_text_primary'))
          .layoutWeight(1)
      }
      .width('100%')

      Column({ space: 4 }) {
        Row() {
          Text($r('app.string.device_cpu_count'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.cpuCount.toString())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.device_selected_cpu'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.selectedCpu.toString())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.device_affinity'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.affinityText())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.device_bind_result'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.bindResult.toString())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')

        Row() {
          Text($r('app.string.device_bind_cpu'))
            .fontSize(13)
            .fontColor($r('app.color.qos_text_secondary'))
            .layoutWeight(1)
          Text(this.bindCpu.toString())
            .fontSize(13)
            .fontColor($r('app.color.qos_text_primary'))
        }
        .width('100%')
      }
      .width('100%')
      .padding(10)
      .borderRadius(8)
      .backgroundColor($r('app.color.qos_card_bg'))

      Text($r('app.string.device_bind_label'))
        .fontSize(14)
        .fontColor($r('app.color.qos_text_secondary'))
        .width('100%')

      Scroll() {
        Column({ space: 6 }) {
          Row({ space: 6 }) {
            ForEach(this.cpuOptions(), (cpu: number) => {
              Button(cpu.toString(), { type: ButtonType.Normal })
                .height(32)
                .width(40)
                .borderRadius(8)
                .fontSize(13)
                .fontColor(this.bindCpu === cpu ? $r('app.color.qos_text_light') : $r('app.color.qos_text_primary'))
                .backgroundColor(this.bindCpu === cpu ? $r('app.color.qos_button_selected') :
                  $r('app.color.qos_button_bg'))
                .enabled(!this.busy)
                .onClick(() => {
                  this.bindCpu = cpu;
                })
            }, (cpu: number) => cpu.toString())
          }
          .width('100%')
        }
        .width('100%')
      }
      .width('100%')
      .height(80)
      .align(Alignment.TopStart)

      Button($r('app.string.device_btn_refresh'), { type: ButtonType.Normal })
        .height(38)
        .width('100%')
        .borderRadius(8)
        .backgroundColor($r('app.color.qos_button_bg'))
        .fontColor($r('app.color.qos_text_primary'))
        .enabled(!this.busy)
        .onClick(() => {
          this.refreshTopology();
        })

      Button($r('app.string.device_btn_bind'), { type: ButtonType.Normal })
        .height(38)
        .width('100%')
        .borderRadius(8)
        .backgroundColor($r('app.color.qos_button_selected'))
        .fontColor($r('app.color.qos_text_light'))
        .enabled(!this.busy && this.bindCpu >= 0)
        .onClick(() => {
          this.bindSelectedCpu();
        })

      Button($r('app.string.device_btn_reset'), { type: ButtonType.Normal })
        .height(38)
        .width('100%')
        .borderRadius(8)
        .backgroundColor($r('app.color.qos_button_bg'))
        .fontColor($r('app.color.qos_text_primary'))
        .enabled(!this.busy)
        .onClick(() => {
          this.resetAffinity();
        })

      Text(this.statusText)
        .fontSize(13)
        .fontColor($r('app.color.qos_text_primary'))
        .width('100%')

      Text($r('app.string.device_note'))
        .fontSize(12)
        .fontColor($r('app.color.qos_text_secondary'))
        .width('100%')
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor($r('app.color.qos_page_bg'))
  }
}
