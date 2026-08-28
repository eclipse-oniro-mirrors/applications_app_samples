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

interface SingleIp {
  family: number;
  addr: string;
}

interface CidrIp {
  family: number;
  addr: string;
  prefix: number;
}

interface IpRange {
  family: number;
  startAddr: string;
  endAddr: string;
}

interface IpValue {
  single?: SingleIp;
  cidr?: CidrIp;
  range?: IpRange;
  multi?: SingleIp[];
}

interface PortRange {
  startPort: number;
  endPort: number;
}

interface PortValue {
  single?: number;
  range?: PortRange;
  multi?: number[];
}

interface IpConfig {
  type: number;
  invert: boolean;
  value?: IpValue;
}

interface PortConfig {
  type: number;
  invert: boolean;
  value?: PortValue;
}

interface InterfaceConfig {
  enabled: boolean;
  invert: boolean;
  isPrefix: boolean;
  ifName: string;
}

interface ProxyIp {
  family: number;
  addr: string;
}

interface RuleConfig {
  priority: number;
  hookPoint: number;
  protocol: number;
  srcIp: IpConfig;
  srcPort: PortConfig;
  dstIp: IpConfig;
  dstPort: PortConfig;
  inInterface: InterfaceConfig;
  outInterface: InterfaceConfig;
  uidStart: number;
  uidEnd: number;
  proxyIp: ProxyIp;
  proxyPort: number;
}

@Entry
@Component
struct RedirectorPage {
  @State currentMode: 'basic' | 'advanced' = 'basic'
  @State currentTab: number = 0
  @State outputContent: string = ''
  @State groupId: number = 1001
  @State priority: number = 100
  @State packetCopyLen: number = 0xFFFF
  @State nfqueueMaxlen: number = 1024
  @State nfqueueFlags: number = 1
  @State rulePriority: number = 100
  @State hookPoint: number = 3
  @State protocol: number = 6
  @State srcIpType: number = 0
  @State srcIpInvert: boolean = false
  @State srcIpAddr: string = ''
  @State srcIpCidr: string = ''
  @State srcIpRangeStart: string = ''
  @State srcIpRangeEnd: string = ''
  @State srcIpMulti: string = ''
  @State srcPortType: number = 0
  @State srcPortInvert: boolean = false
  @State srcPortSingle: number = 0
  @State srcPortStart: number = 0
  @State srcPortEnd: number = 65535
  @State srcPortMulti: string = ''
  @State dstIpType: number = 1
  @State dstIpAddr: string = '192.168.1.100'
  @State dstIpCidr: string = ''
  @State dstIpRangeStart: string = ''
  @State dstIpRangeEnd: string = ''
  @State dstIpMulti: string = ''
  @State dstPortType: number = 1
  @State dstPortSingle: number = 80
  @State dstPortStart: number = 0
  @State dstPortEnd: number = 65535
  @State dstPortMulti: string = ''
  @State inIfEnabled: boolean = false
  @State inIfInvert: boolean = false
  @State inIfIsPrefix: boolean = false
  @State inIfName: string = ''
  @State outIfEnabled: boolean = false
  @State outIfInvert: boolean = false
  @State outIfIsPrefix: boolean = false
  @State outIfName: string = ''
  @State uidStart: number = 4294967295
  @State uidEnd: number = 4294967295
  @State proxyIp: string = '127.0.0.1'
  @State proxyPort: number = 8080
  @State advancedJson: string = ''
  private readonly IP_FAMILY_IPV4: number = 1
  private readonly IP_FAMILY_IPV6: number = 2

  readonly hookPointOptions: Array<SelectOption> = [
    { value: 'INPUT' },
    { value: 'OUTPUT' },
    { value: 'FORWARD' },
    { value: 'PREROUTING' },
    { value: 'POSTROUTING' }
  ]
  readonly ipTypeOptions: Array<SelectOption> = [
    { value: 'ANY' },
    { value: 'SINGLE' },
    { value: 'CIDR' },
    { value: 'RANGE' },
    { value: 'MULTI' }
  ]
  readonly portTypeOptions: Array<SelectOption> = [
    { value: 'ANY' },
    { value: 'SINGLE' },
    { value: 'RANGE' },
    { value: 'MULTI' }
  ]

  private getIpFamily(ip: string): number {
    const addr = ip.trim()
    if (addr.includes(':')) {
      return this.IP_FAMILY_IPV6
    }
    return this.IP_FAMILY_IPV4
  }
  private getDefaultCidrPrefix(family: number): number {
    return family === this.IP_FAMILY_IPV6 ? 64 : 24
  }
  private parseCidrPrefix(prefixStr: string, family: number): number {
    const prefix = parseInt(prefixStr, 10)
    const maxPrefix = family === this.IP_FAMILY_IPV6 ? 128 : 32
    return prefix
  }

  getTabHeight(): number {
    if (this.currentTab === 1) {
      return 580
    }
    if (this.currentTab === 2) {
      return 580
    }
    return 360
  }

  build() {
    Column() {
      Row() {
        Button('<').fontSize(20).fontColor('#000000').backgroundColor('#FFFFFF')
          .onClick(() => router.back())
        Text('Traffic Redirector Management')
          .fontSize(24)
          .fontWeight(500)
          .fontColor('#000000')
          .margin({ left: 20 })
      }
      .width('100%')
      .height(50)
      .padding({ left: 16, right: 16 })

      Divider().color('gray').strokeWidth(1)

      Row() {
        Button('Basic Mode')
          .fontSize(16)
          .fontColor(this.currentMode === 'basic' ? '#FFFFFF' : '#000000')
          .backgroundColor(this.currentMode === 'basic' ? '#007DFF' : '#F0F0F0')
          .onClick(() => {
            this.currentMode = 'basic'
            this.currentTab = 0
          })

        Button('Advanced JSON Mode')
          .fontSize(16)
          .fontColor(this.currentMode === 'advanced' ? '#FFFFFF' : '#000000')
          .backgroundColor(this.currentMode === 'advanced' ? '#007DFF' : '#F0F0F0')
          .onClick(() => this.currentMode = 'advanced')
      }
      .width('100%')
      .height(50)
      .justifyContent(FlexAlign.SpaceEvenly)
      .margin({ top: 10 })

      Scroll() {
        Column() {
          if (this.currentMode === 'basic') {
            this.BasicModeContent()
          } else {
            this.AdvancedModeContent()
          }
        }
      }
      .layoutWeight(1)
      .scrollBar(BarState.Auto)
      .margin({ top: 10 })

      Column({ space: 10 }) {
        Text('Operation Results')
          .fontSize(18)
          .fontWeight(600)
          .fontColor('#000000')

        TextArea({ text: this.outputContent })
          .width('100%')
          .height(150)
          .backgroundColor('#F5F5F5')
          .fontColor('#FF0000')
          .fontSize(14)
          .borderRadius(8)
      }
      .width('100%')
      .margin({ top: 10, bottom: 20 })
      .padding({ left: 16, right: 16 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
  }

  @Builder
  BasicModeContent() {
    Column({ space: 15 }) {
      this.SectionTitle('Redirector Configuration')
      this.RedirectorFields()

      Divider().color('gray').strokeWidth(1)

      this.SectionTitle('Redirect Rule Configuration')

      Tabs({ index: this.currentTab }) {
        TabContent() {
          this.BasicConfigTab()
        }.tabBar('Basic Config')

        TabContent() {
          this.SrcAddrPortTab()
        }.tabBar('Src Addr/Port')

        TabContent() {
          this.DstAddrPortTab()
        }.tabBar('Dst Addr/Port')

        TabContent() {
          this.InterfaceUidTab()
        }.tabBar('Interface/UID')

        TabContent() {
          this.ProxyConfigTab()
        }.tabBar('Proxy Config')
      }
      .width('100%')
      .height(this.getTabHeight())
      .barMode(BarMode.Scrollable)
      .onChange((index: number) => {
        this.currentTab = index
      })

      Divider().color('gray').strokeWidth(1)

      this.OperationButtons()
    }
    .width('100%')
    .padding({ left: 16, right: 16 })
  }

  @Builder
  SectionTitle(title: string) {
    Text(title)
      .fontSize(20)
      .fontWeight(600)
      .fontColor('#000000')
      .margin({ top: 10 })
  }

  @Builder
  RedirectorFields() {
    Column({ space: 10 }) {
      Row({ space: 15 }) {
        Column({ space: 5 }) {
          Text('Group ID').fontSize(14).fontColor('#666666')
          TextInput({ text: this.groupId.toString() })
            .type(InputType.Number)
            .width('48%')
            .onChange((value: string) => {
              this.groupId = parseInt(value) || 0
            })
        }

        Column({ space: 5 }) {
          Text('Priority').fontSize(14).fontColor('#666666')
          TextInput({ text: this.priority.toString() })
            .type(InputType.Number)
            .width('48%')
            .onChange((value: string) => {
              this.priority = parseInt(value) || 0
            })
        }
      }
      .width('100%')

      Row({ space: 15 }) {
        Column({ space: 5 }) {
          Text('Packet Copy Len').fontSize(14).fontColor('#666666')
          TextInput({ text: this.packetCopyLen.toString() })
            .type(InputType.Number)
            .width('48%')
            .onChange((value: string) => {
              this.packetCopyLen = parseInt(value) || 0xFFFF
            })
        }

        Column({ space: 5 }) {
          Text('NFQueue MaxLen').fontSize(14).fontColor('#666666')
          TextInput({ text: this.nfqueueMaxlen.toString() })
            .type(InputType.Number)
            .width('48%')
            .onChange((value: string) => {
              this.nfqueueMaxlen = parseInt(value) || 1024
            })
        }
      }
      .width('100%')

      Row() {
        Text('NFQueue Flags').fontSize(14).fontColor('#666666')
        TextInput({ text: this.nfqueueFlags.toString() })
          .type(InputType.Number)
          .width('48%')
          .onChange((value: string) => {
            this.nfqueueFlags = parseInt(value) || 1
          })
      }
      .width('100%')

      Row({ space: 15 }) {
        Button('Create Redirector')
          .fontSize(16)
          .fontColor('#FFFFFF')
          .backgroundColor('#007DFF')
          .onClick(this.handleCreateRedirector)

        Button('Destroy Redirector')
          .fontSize(16)
          .fontColor('#FFFFFF')
          .backgroundColor('#FF0000')
          .onClick(this.handleDestroyRedirector)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
  }

  @Builder
  BasicConfigTab() {
    Column({ space: 15 }) {
      Row({ space: 15 }) {
        Column({ space: 5 }) {
          Text('Rule Priority').fontSize(14).fontColor('#666666')
          TextInput({ text: this.rulePriority.toString() })
            .type(InputType.Number)
            .width('48%')
            .onChange((value: string) => {
              this.rulePriority = parseInt(value) || 100
            })
        }

        Column({ space: 5 }) {
          Text('Hook Point').fontSize(14).fontColor('#666666')
          Select(this.hookPointOptions)
            .selected(this.hookPoint)
            .value(this.hookPoint.toString())
            .width('48%')
            .onSelect((index: number) => {
              this.hookPoint = index
            })
        }
      }
      .width('100%')

      Row() {
        Text('Protocol').fontSize(14).fontColor('#666666')
        Text('TCP (6)').fontSize(16).fontColor('#007DFF').margin({ left: 10 })
      }
      .width('100%')
    }
    .width('100%')
    .padding(15)
  }

  @Builder
  SrcAddrPortTab() {
    Column({ space: 15 }) {
      Column({ space: 10 }) {
        Text('Source IP Configuration').fontSize(16).fontWeight(600).fontColor('#000000')

        Row({ space: 15 }) {
          Column({ space: 5 }) {
            Text('IP Type').fontSize(14).fontColor('#666666')
            Select(this.ipTypeOptions)
              .selected(this.srcIpType)
              .width('48%')
              .onSelect((index: number) => {
                this.srcIpType = index
              })
          }

          Column({ space: 5 }) {
            Text('Invert').fontSize(14).fontColor('#666666')
            Toggle({ type: ToggleType.Switch, isOn: this.srcIpInvert })
              .onChange((isOn: boolean) => {
                this.srcIpInvert = isOn
              })
          }
        }
        .width('100%')

        if (this.srcIpType === 1) {
          Text('IP Address').fontSize(14).fontColor('#666666')
          TextInput({ placeholder: 'e.g., 192.168.1.1', text: this.srcIpAddr })
            .width('100%')
            .onChange((value: string) => {
              this.srcIpAddr = value
              hilog.info(0x0000, 'UI', 'srcIpAddr changed: %{public}s', value)
            })
        } else if (this.srcIpType === 2) {
          Text('CIDR Notation').fontSize(14).fontColor('#666666')
          TextInput({ placeholder: 'e.g., 192.168.1.0/24', text: this.srcIpCidr })
            .width('100%')
            .onChange((value: string) => {
              this.srcIpCidr = value
              hilog.info(0x0000, 'UI', 'srcIpCidr changed: %{public}s', value)
            })
        } else if (this.srcIpType === 3) {
          Column({ space: 10 }) {
            Column({ space: 5 }) {
              Text('Start IP').fontSize(14).fontColor('#666666')
              TextInput({ placeholder: 'e.g., 192.168.1.1', text: this.srcIpRangeStart })
                .width('100%')
                .onChange((value: string) => {
                  this.srcIpRangeStart = value
                  hilog.info(0x0000, 'UI', 'srcIpRangeStart changed: %{public}s', value)
                })
            }

            Column({ space: 5 }) {
              Text('End IP').fontSize(14).fontColor('#666666')
              TextInput({ placeholder: 'e.g., 192.168.1.100', text: this.srcIpRangeEnd })
                .width('100%')
                .onChange((value: string) => {
                  this.srcIpRangeEnd = value
                  hilog.info(0x0000, 'UI', 'srcIpRangeEnd changed: %{public}s', value)
                })
            }
          }
        } else if (this.srcIpType === 4) {
          Text('Multiple IPs (comma-separated, max 16)').fontSize(14).fontColor('#666666')
          TextArea({
            placeholder: 'e.g., 192.168.1.1, 192.168.1.2, 192.168.1.3',
            text: this.srcIpMulti
          })
            .width('100%')
            .height(60)
            .onChange((value: string) => {
              this.srcIpMulti = value
              hilog.info(0x0000, 'UI', 'srcIpMulti changed: %{public}s', value)
            })
        }
      }
      .layoutWeight(1)
      .justifyContent(FlexAlign.Start)

      Divider().color('gray').strokeWidth(1)

      Column({ space: 10 }) {
        Text('Source Port Configuration').fontSize(16).fontWeight(600).fontColor('#000000')

        Row({ space: 15 }) {
          Column({ space: 5 }) {
            Text('Port Type').fontSize(14).fontColor('#666666')
            Select(this.portTypeOptions)
              .selected(this.srcPortType)
              .width('48%')
              .onSelect((index: number) => {
                this.srcPortType = index
              })
          }

          Column({ space: 5 }) {
            Text('Invert').fontSize(14).fontColor('#666666')
            Toggle({ type: ToggleType.Switch, isOn: this.srcPortInvert })
              .onChange((isOn: boolean) => {
                this.srcPortInvert = isOn
              })
          }
        }
        .width('100%')

        if (this.srcPortType === 1) {
          Text('Single Port').fontSize(14).fontColor('#666666')
          TextInput({ text: this.srcPortSingle.toString() })
            .type(InputType.Number)
            .width('100%')
            .onChange((value: string) => {
              this.srcPortSingle = parseInt(value) || 0
              hilog.info(0x0000, 'UI', 'srcPortSingle changed: %{public}s', value)
            })
        } else if (this.srcPortType === 2) {
          Row({ space: 15 }) {
            Column({ space: 5 }) {
              Text('Start Port').fontSize(14).fontColor('#666666')
              TextInput({ text: this.srcPortStart.toString() })
                .type(InputType.Number)
                .width('48%')
                .onChange((value: string) => {
                  this.srcPortStart = parseInt(value) || 0
                  hilog.info(0x0000, 'UI', 'srcPortStart changed: %{public}s', value)
                })
            }

            Column({ space: 5 }) {
              Text('End Port').fontSize(14).fontColor('#666666')
              TextInput({ text: this.srcPortEnd.toString() })
                .type(InputType.Number)
                .width('48%')
                .onChange((value: string) => {
                  this.srcPortEnd = parseInt(value) || 65535
                  hilog.info(0x0000, 'UI', 'srcPortEnd changed: %{public}s', value)
                })
            }
          }
          .width('100%')
        } else if (this.srcPortType === 3) {
          Text('Multiple Ports (comma-separated, max 64)').fontSize(14).fontColor('#666666')
          TextArea({
            placeholder: 'e.g., 80, 443, 8080',
            text: this.srcPortMulti
          })
            .width('100%')
            .height(60)
            .onChange((value: string) => {
              this.srcPortMulti = value
              hilog.info(0x0000, 'UI', 'srcPortMulti changed: %{public}s', value)
            })
        }
      }
      .layoutWeight(1)
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .padding(15)
  }

  @Builder
  DstAddrPortTab() {
    Column({ space: 15 }) {
      Column({ space: 10 }) {
        Text('Destination IP Configuration').fontSize(16).fontWeight(600).fontColor('#000000')

        Row({ space: 15 }) {
          Column({ space: 5 }) {
            Text('IP Type').fontSize(14).fontColor('#666666')
            Select(this.ipTypeOptions)
              .selected(this.dstIpType)
              .width('48%')
              .onSelect((index: number) => {
                this.dstIpType = index
              })
          }
        }
        .width('100%')

        if (this.dstIpType === 1) {
          Text('IP Address').fontSize(14).fontColor('#666666')
          TextInput({ placeholder: 'e.g., 192.168.1.100', text: this.dstIpAddr })
            .width('100%')
            .onChange((value: string) => {
              this.dstIpAddr = value
              hilog.info(0x0000, 'UI', 'dstIpAddr changed: %{public}s', value)
            })
        } else if (this.dstIpType === 2) {
          Text('CIDR Notation').fontSize(14).fontColor('#666666')
          TextInput({ placeholder: 'e.g., 192.168.1.0/24', text: this.dstIpCidr })
            .width('100%')
            .onChange((value: string) => {
              this.dstIpCidr = value
              hilog.info(0x0000, 'UI', 'dstIpCidr changed: %{public}s', value)
            })
        } else if (this.dstIpType === 3) {
          Column({ space: 10 }) {
            Column({ space: 5 }) {
              Text('Start IP').fontSize(14).fontColor('#666666')
              TextInput({ placeholder: 'e.g., 192.168.1.1', text: this.dstIpRangeStart })
                .width('100%')
                .onChange((value: string) => {
                  this.dstIpRangeStart = value
                  hilog.info(0x0000, 'UI', 'dstIpRangeStart changed: %{public}s', value)
                })
            }

            Column({ space: 5 }) {
              Text('End IP').fontSize(14).fontColor('#666666')
              TextInput({ placeholder: 'e.g., 192.168.1.100', text: this.dstIpRangeEnd })
                .width('100%')
                .onChange((value: string) => {
                  this.dstIpRangeEnd = value
                  hilog.info(0x0000, 'UI', 'dstIpRangeEnd changed: %{public}s', value)
                })
            }
          }
        } else if (this.dstIpType === 4) {
          Text('Multiple IPs (comma-separated, max 16)').fontSize(14).fontColor('#666666')
          TextArea({
            placeholder: 'e.g., 192.168.1.1, 192.168.1.2, 192.168.1.3',
            text: this.dstIpMulti
          })
            .width('100%')
            .height(60)
            .onChange((value: string) => {
              this.dstIpMulti = value
              hilog.info(0x0000, 'UI', 'dstIpMulti changed: %{public}s', value)
            })
        }
      }
      .layoutWeight(1)
      .justifyContent(FlexAlign.Start)

      Divider().color('gray').strokeWidth(1)

      Column({ space: 10 }) {
        Text('Destination Port Configuration').fontSize(16).fontWeight(600).fontColor('#000000')

        Row({ space: 15 }) {
          Column({ space: 5 }) {
            Text('Port Type').fontSize(14).fontColor('#666666')
            Select(this.portTypeOptions)
              .selected(this.dstPortType)
              .width('48%')
              .onSelect((index: number) => {
                this.dstPortType = index
              })
          }
        }
        .width('100%')

        if (this.dstPortType === 1) {
          Text('Single Port').fontSize(14).fontColor('#666666')
          TextInput({ text: this.dstPortSingle.toString() })
            .type(InputType.Number)
            .width('100%')
            .onChange((value: string) => {
              this.dstPortSingle = parseInt(value) || 80
              hilog.info(0x0000, 'UI', 'dstPortSingle changed: %{public}s', value)
            })
        } else if (this.dstPortType === 2) {
          Row({ space: 15 }) {
            Column({ space: 5 }) {
              Text('Start Port').fontSize(14).fontColor('#666666')
              TextInput({ text: this.dstPortStart.toString() })
                .type(InputType.Number)
                .width('48%')
                .onChange((value: string) => {
                  this.dstPortStart = parseInt(value) || 0
                  hilog.info(0x0000, 'UI', 'dstPortStart changed: %{public}s', value)
                })
            }

            Column({ space: 5 }) {
              Text('End Port').fontSize(14).fontColor('#666666')
              TextInput({ text: this.dstPortEnd.toString() })
                .type(InputType.Number)
                .width('48%')
                .onChange((value: string) => {
                  this.dstPortEnd = parseInt(value) || 65535
                  hilog.info(0x0000, 'UI', 'dstPortEnd changed: %{public}s', value)
                })
            }
          }
          .width('100%')
        } else if (this.dstPortType === 3) {
          Text('Multiple Ports (comma-separated, max 64)').fontSize(14).fontColor('#666666')
          TextArea({
            placeholder: 'e.g., 80, 443, 8080',
            text: this.dstPortMulti
          })
            .width('100%')
            .height(60)
            .onChange((value: string) => {
              this.dstPortMulti = value
              hilog.info(0x0000, 'UI', 'dstPortMulti changed: %{public}s', value)
            })
        }
      }
      .layoutWeight(1)
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .padding(15)
  }

  @Builder
  InterfaceUidTab() {
    Column({ space: 15 }) {
      Text('Interface Match Configuration').fontSize(16).fontWeight(600).fontColor('#000000')

      Column({ space: 10 }) {
        Text('Incoming Interface').fontSize(14).fontColor('#666666')
        Row({ space: 15 }) {
          Column({ space: 5 }) {
            Text('Enabled').fontSize(12).fontColor('#999999')
            Toggle({ type: ToggleType.Switch, isOn: this.inIfEnabled })
              .onChange((isOn: boolean) => {
                this.inIfEnabled = isOn
              })
          }

          Column({ space: 5 }) {
            Text('Invert Match').fontSize(12).fontColor('#999999')
            Toggle({ type: ToggleType.Switch, isOn: this.inIfInvert })
              .onChange((isOn: boolean) => {
                this.inIfInvert = isOn
              })
          }
          .margin({ left: 15 })

          Column({ space: 5 }) {
            Text('Prefix Match').fontSize(12).fontColor('#999999')
            Toggle({ type: ToggleType.Switch, isOn: this.inIfIsPrefix })
              .onChange((isOn: boolean) => {
                this.inIfIsPrefix = isOn
              })
          }
          .margin({ left: 15 })
        }

        if (this.inIfEnabled) {
          TextInput({ placeholder: 'Interface Name', text: this.inIfName })
            .width('100%')
            .onChange((value: string) => {
              this.inIfName = value
            })
        }
      }

      Divider().color('gray').strokeWidth(1)

      Column({ space: 10 }) {
        Text('Outgoing Interface').fontSize(14).fontColor('#666666')
        Row({ space: 15 }) {
          Column({ space: 5 }) {
            Text('Enabled').fontSize(12).fontColor('#999999')
            Toggle({ type: ToggleType.Switch, isOn: this.outIfEnabled })
              .onChange((isOn: boolean) => {
                this.outIfEnabled = isOn
              })
          }

          Column({ space: 5 }) {
            Text('Invert Match').fontSize(12).fontColor('#999999')
            Toggle({ type: ToggleType.Switch, isOn: this.outIfInvert })
              .onChange((isOn: boolean) => {
                this.outIfInvert = isOn
              })
          }
          .margin({ left: 15 })

          Column({ space: 5 }) {
            Text('Prefix Match').fontSize(12).fontColor('#999999')
            Toggle({ type: ToggleType.Switch, isOn: this.outIfIsPrefix })
              .onChange((isOn: boolean) => {
                this.outIfIsPrefix = isOn
              })
          }
          .margin({ left: 15 })
        }

        if (this.outIfEnabled) {
          TextInput({ placeholder: 'Interface Name', text: this.outIfName })
            .width('100%')
            .onChange((value: string) => {
              this.outIfName = value
            })
        }
      }

      Divider().color('gray').strokeWidth(1)

      Text('UID Range Configuration').fontSize(16).fontWeight(600).fontColor('#000000')
      Row({ space: 15 }) {
        Column({ space: 5 }) {
          Text('UID Start').fontSize(14).fontColor('#666666')
          TextInput({ text: this.uidStart.toString() })
            .type(InputType.Number)
            .width('48%')
            .onChange((value: string) => {
              this.uidStart = parseInt(value) || 4294967295
            })
        }

        Column({ space: 5 }) {
          Text('UID End').fontSize(14).fontColor('#666666')
          TextInput({ text: this.uidEnd.toString() })
            .type(InputType.Number)
            .width('48%')
            .onChange((value: string) => {
              this.uidEnd = parseInt(value) || 4294967295
            })
        }
      }
      .width('100%')
    }
    .width('100%')
    .padding(15)
  }

  @Builder
  ProxyConfigTab() {
    Column({ space: 15 }) {
      Text('Proxy Server Configuration').fontSize(16).fontWeight(600).fontColor('#000000')

      Column({ space: 10 }) {
        Text('Proxy IP Address').fontSize(14).fontColor('#666666')
        TextInput({ placeholder: 'e.g., 127.0.0.1', text: this.proxyIp })
          .width('100%')
          .onChange((value: string) => {
            this.proxyIp = value
          })
      }

      Column({ space: 10 }) {
        Text('Proxy Port').fontSize(14).fontColor('#666666')
        TextInput({ text: this.proxyPort.toString() })
          .type(InputType.Number)
          .width('100%')
          .onChange((value: string) => {
            this.proxyPort = parseInt(value) || 0
          })
      }
    }
    .width('100%')
    .padding(15)
  }

  @Builder
  OperationButtons() {
    Column({ space: 10 }) {
      Row({ space: 15 }) {
        Button('Add Redirect Rule')
          .fontSize(16)
          .fontColor('#FFFFFF')
          .backgroundColor('#007DFF')
          .onClick(this.handleAddRedirectRule)

        Button('Clear All Rules')
          .fontSize(16)
          .fontColor('#FFFFFF')
          .backgroundColor('#FF9800')
          .onClick(this.handleClearRedirectRule)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
  }

  @Builder
  AdvancedModeContent() {
    Column({ space: 15 }) {
      Text('Advanced JSON Configuration').fontSize(18).fontWeight(600).fontColor('#000000')

      Row({ space: 10 }) {
        Button('Load Basic Template')
          .fontSize(14)
          .onClick(() => {
            this.advancedJson = trafficFilterSdk.getRuleTemplate('basic')
          })

        Button('Load Full Template')
          .fontSize(14)
          .onClick(() => {
            this.advancedJson = trafficFilterSdk.getRuleTemplate('full')
          })
      }
      .width('100%')

      TextArea({
        text: this.advancedJson,
        placeholder: 'Enter redirect rule JSON configuration here...'
      })
        .width('100%')
        .height(300)
        .backgroundColor('#F5F5F5')
        .fontSize(14)
        .onChange((value: string) => {
          this.advancedJson = value
        })

      Row({ space: 15 }) {
        Button('Add Redirect Rule (JSON)')
          .fontSize(16)
          .fontColor('#FFFFFF')
          .backgroundColor('#007DFF')
          .onClick(this.handleAddRedirectRuleJson)

        Button('Clear All Rules')
          .fontSize(16)
          .fontColor('#FFFFFF')
          .backgroundColor('#FF9800')
          .onClick(this.handleClearRedirectRule)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .padding(15)
  }

  private handleCreateRedirector = async () => {
    try {
      let res: string = trafficFilterSdk.createRedirector(
        this.groupId,
        this.priority,
        this.packetCopyLen,
        this.nfqueueMaxlen,
        this.nfqueueFlags
      )
      this.outputContent = this.outputContent + res + '\n'
      hilog.info(0x0000, 'TestTag', 'CreateRedirector success')
    } catch (err) {
      let e: BusinessError = err as BusinessError
      this.outputContent = this.outputContent + `ERROR: ${e.message}` + '\n'
      hilog.error(0x0000, 'TestTag', 'CreateRedirector error: %{public}s', e.message)
    }
  }
  private handleDestroyRedirector = async () => {
    try {
      let res: string = trafficFilterSdk.destroyRedirector()
      this.outputContent = this.outputContent + res + '\n'
      hilog.info(0x0000, 'TestTag', 'DestroyRedirector success')
    } catch (err) {
      let e: BusinessError = err as BusinessError
      this.outputContent = this.outputContent + `ERROR: ${e.message}` + '\n'
      hilog.error(0x0000, 'TestTag', 'DestroyRedirector error: %{public}s', e.message)
    }
  }
  private handleAddRedirectRule = async () => {
    const ruleJson = this.buildRuleJson()
    this.addRuleWithJson(ruleJson)
  }
  private handleAddRedirectRuleJson = async () => {
    if (!this.advancedJson || this.advancedJson.trim().length === 0) {
      this.outputContent = this.outputContent + 'ERROR: JSON configuration is empty\n'
      return
    }
    this.addRuleWithJson(this.advancedJson)
  }
  private addRuleWithJson = async (jsonStr: string) => {
    try {
      let res: string = trafficFilterSdk.addRedirectRule(jsonStr)
      this.outputContent = this.outputContent + res + '\n'
      hilog.info(0x0000, 'TestTag', 'AddRedirectRule success')
    } catch (err) {
      let e: BusinessError = err as BusinessError
      this.outputContent = this.outputContent + `ERROR: ${e.message}\n` + JSON.stringify(err) + '\n'
      hilog.error(0x0000, 'TestTag', 'AddRedirectRule error: %{public}s', e.message)
    }
  }
  private handleClearRedirectRule = async () => {
    try {
      let res: string = trafficFilterSdk.clearRedirectRule()
      this.outputContent = this.outputContent + res + '\n'
      hilog.info(0x0000, 'TestTag', 'ClearRedirectRule success')
    } catch (err) {
      let e: BusinessError = err as BusinessError
      this.outputContent = this.outputContent + `ERROR: ${e.message}` + '\n'
      hilog.error(0x0000, 'TestTag', 'ClearRedirectRule error: %{public}s', e.message)
    }
  }
  private buildRuleJson = (): string => {
    hilog.info(0x0000, 'UI', 'buildRuleJson - srcIpAddr: %{public}s, dstIpAddr: %{public}s', this.srcIpAddr,
      this.dstIpAddr)

    const rule: RuleConfig = {
      priority: this.rulePriority,
      hookPoint: this.hookPoint,
      protocol: 6,
      srcIp: {
        type: this.srcIpType,
        invert: this.srcIpInvert
      },
      srcPort: {
        type: this.srcPortType,
        invert: this.srcPortInvert
      },
      dstIp: {
        type: this.dstIpType,
        invert: false
      },
      dstPort: {
        type: this.dstPortType,
        invert: false
      },
      inInterface: {
        enabled: this.inIfEnabled,
        invert: this.inIfInvert,
        isPrefix: this.inIfIsPrefix,
        ifName: this.inIfName
      },
      outInterface: {
        enabled: this.outIfEnabled,
        invert: this.outIfInvert,
        isPrefix: this.outIfIsPrefix,
        ifName: this.outIfName
      },
      uidStart: this.uidStart,
      uidEnd: this.uidEnd,
      proxyIp: {
        family: this.getIpFamily(this.proxyIp),
        addr: this.proxyIp
      },
      proxyPort: this.proxyPort
    }

    if (this.srcIpType === 1 && this.srcIpAddr) {
      const family = this.getIpFamily(this.srcIpAddr)
      rule.srcIp.value = {
        single: {
          family: family,
          addr: this.srcIpAddr
        }
      };
      hilog.info(0x0000, 'UI', 'Added srcIp SINGLE: %{public}s', this.srcIpAddr)
    } else if (this.srcIpType === 2 && this.srcIpCidr) {
      const cidrParts = this.srcIpCidr.split('/')
      if (cidrParts.length === 2) {
        const addr = cidrParts[0].trim()
        const family = this.getIpFamily(addr)
        const prefix = this.parseCidrPrefix(cidrParts[1], family)
        rule.srcIp.value = {
          cidr: {
            family: family,
            addr: addr,
            prefix: prefix
          }
        }
        hilog.info(0x0000, 'UI', 'Added srcIp CIDR: %{public}s', this.srcIpCidr)
      }
    } else if (this.srcIpType === 3 && this.srcIpRangeStart && this.srcIpRangeEnd) {
      const family = this.getIpFamily(this.srcIpRangeStart)
      rule.srcIp.value = {
        range: {
          family: family,
          startAddr: this.srcIpRangeStart,
          endAddr: this.srcIpRangeEnd
        }
      }
      hilog.info(0x0000, 'UI', 'Added srcIp RANGE: %{public}s - %{public}s', this.srcIpRangeStart, this.srcIpRangeEnd)
    } else if (this.srcIpType === 4 && this.srcIpMulti) {
      const ips = this.srcIpMulti.split(',')
        .map(ip => ip.trim())
        .filter(ip => ip.length > 0)
      const singleIps = ips.map(ip => ({
        family: this.getIpFamily(ip),
        addr: ip
      } as SingleIp))
      rule.srcIp.value = {
        multi: singleIps
      }
      hilog.info(0x0000, 'UI', 'Added srcIp MULTI: %{public} IPs', singleIps.length.toString())
    }

    if (this.dstIpType === 1 && this.dstIpAddr) {
      const family = this.getIpFamily(this.dstIpAddr)
      rule.dstIp.value = {
        single: {
          family: family,
          addr: this.dstIpAddr
        }
      }
      hilog.info(0x0000, 'UI', 'Added dstIp SINGLE: %{public}s', this.dstIpAddr)
    } else if (this.dstIpType === 2 && this.dstIpCidr) {
      const cidrParts = this.dstIpCidr.split('/')
      if (cidrParts.length === 2) {
        const addr = cidrParts[0].trim()
        const family = this.getIpFamily(addr)
        const prefix = this.parseCidrPrefix(cidrParts[1], family)
        rule.dstIp.value = {
          cidr: {
            family: family,
            addr: addr,
            prefix: prefix
          }
        }
        hilog.info(0x0000, 'UI', 'Added dstIp CIDR: %{public}s', this.dstIpCidr)
      }
    } else if (this.dstIpType === 3 && this.dstIpRangeStart && this.dstIpRangeEnd) {
      const family = this.getIpFamily(this.dstIpRangeStart)
      rule.dstIp.value = {
        range: {
          family: family,
          startAddr: this.dstIpRangeStart,
          endAddr: this.dstIpRangeEnd
        }
      }
      hilog.info(0x0000, 'UI', 'Added dstIp RANGE: %{public}s - %{public}s', this.dstIpRangeStart, this.dstIpRangeEnd)
    } else if (this.dstIpType === 4 && this.dstIpMulti) {
      const ips = this.dstIpMulti.split(',')
        .map(ip => ip.trim())
        .filter(ip => ip.length > 0)
      const singleIps = ips.map(ip => ({
        family: this.getIpFamily(ip),
        addr: ip
      } as SingleIp))
      rule.dstIp.value = {
        multi: singleIps
      }
      hilog.info(0x0000, 'UI', 'Added dstIp MULTI: %{public} IPs', singleIps.length.toString())
    }

    if (this.srcPortType === 1) {
      rule.srcPort.value = {
        single: this.srcPortSingle
      };
      hilog.info(0x0000, 'UI', 'Added srcPort SINGLE: %{public}d', this.srcPortSingle)
    } else if (this.srcPortType === 2) {
      rule.srcPort.value = {
        range: {
          startPort: this.srcPortStart,
          endPort: this.srcPortEnd
        }
      };
      hilog.info(0x0000, 'UI', 'Added srcPort RANGE: %{public}d - %{public}d', this.srcPortStart, this.srcPortEnd)
    } else if (this.srcPortType === 3 && this.srcPortMulti) {
      const ports = this.srcPortMulti.split(',').map(p => parseInt(p.trim()) || 0).filter(p => p > 0)
      rule.srcPort.value = {
        multi: ports
      };
      hilog.info(0x0000, 'UI', 'Added srcPort MULTI: %{public} ports', ports.length.toString())
    }

    if (this.dstPortType === 1) {
      rule.dstPort.value = {
        single: this.dstPortSingle
      };
      hilog.info(0x0000, 'UI', 'Added dstPort SINGLE: %{public}d', this.dstPortSingle)
    } else if (this.dstPortType === 2) {
      rule.dstPort.value = {
        range: {
          startPort: this.dstPortStart,
          endPort: this.dstPortEnd
        }
      };
      hilog.info(0x0000, 'UI', 'Added dstPort RANGE: %{public}d - %{public}d', this.dstPortStart, this.dstPortEnd)
    } else if (this.dstPortType === 3 && this.dstPortMulti) {
      const ports = this.dstPortMulti.split(',').map(p => parseInt(p.trim()) || 0).filter(p => p > 0)
      rule.dstPort.value = {
        multi: ports
      };
      hilog.info(0x0000, 'UI', 'Added dstPort MULTI: %{public} ports', ports.length.toString())
    }

    const jsonStr = JSON.stringify(rule)
    hilog.info(0x0000, 'UI', 'Generated rule JSON: %{public}s', jsonStr)
    return jsonStr;
  }
}
