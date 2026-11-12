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

/**
 * 分布式扩展演示页。
 * 真回调（onCreate/onCollaborate）只会由系统拉起扩展时触发，普通应用签名下这台设备不会走那条路径，
 * 因此页面分两层：先用 bundleManager 证明「distributed 扩展注册被系统接受」，
 * 再用与扩展同源的纯函数模拟 onCollaborate 的返回值，两层都不夸大。
 */

import { PAGE_LOG_LIMIT } from '../../common/AppConstants';
import { AppColors, AppSpacing, AppText } from '../../common/Theme';
import { text, text2 } from '../../common/StringResource';
import { ActionButton, KeyValueRow, SectionCard, StatusChip, WidgetTone } from '../../components/CommonWidgets';
import { LogPanel } from '../../components/LogPanel';
import { CollaborateRequest, mockRequest, summarizeRequest } from '../../model/CollabModel';
import { FeatureKind, FeatureMeta, metaOf, noteText, summaryText, titleText } from '../../model/DistributedCatalog';
import { LogLevel } from '../../model/LogStore';
import { COLLABORATE_ACCEPT, COLLABORATE_REJECT, collaborateResultName } from '../../model/ProbeState';
import { EnumSnapshot, ExtensionInfoResult, probeEnums, probeSyscap, readExtensionInfo } from '../../utils/DistributedProbe';
import { Logger } from '../../utils/Logger';

const SOURCE: string = 'ExtensionDemo';

@Component
export struct ExtensionDemo {
  navPathStack: NavPathStack = new NavPathStack();
  @State extensionText: string = text('demo_unread');
  @State extensionDeclared: boolean = false;
  @State syscapText: string = text('demo_unread');
  @State syscapSupported: boolean = false;
  @State enumText: string = text('demo_unread');
  @State indexText: string = 'sample-index-0';
  @State requestText: string = text('ext_request_none');
  @State resultText: string = text('demo_dash');
  @State accepted: boolean = false;
  private meta: FeatureMeta = metaOf(FeatureKind.EXTENSION);

  aboutToAppear(): void {
    this.readExtension();
    this.readSyscap();
    this.readEnums();
    Logger.info(SOURCE, 'Page', 'extension demo opened');
  }

  aboutToDisappear(): void {
    Logger.info(SOURCE, 'Page', 'extension demo closed');
  }

  private readExtension(): void {
    const result: ExtensionInfoResult = readExtensionInfo();
    this.extensionDeclared = result.declared;
    this.extensionText = result.describe();
    Logger.record(result.declared ? LogLevel.INFO : LogLevel.WARN, SOURCE, 'ExtensionRegister', this.extensionText);
  }

  private readSyscap(): void {
    const outcome = probeSyscap();
    this.syscapSupported = outcome.succeeded();
    this.syscapText = text2('probe_hint_pair', outcome.describe(), outcome.hint());
    Logger.record(outcome.succeeded() ? LogLevel.INFO : LogLevel.ERROR, SOURCE, 'canIUse', outcome.describe());
  }

  private readEnums(): void {
    const snapshot: EnumSnapshot = probeEnums();
    this.enumText = snapshot.describe();
    Logger.record(snapshot.consistent() ? LogLevel.INFO : LogLevel.ERROR, SOURCE, 'EnumCheck', this.enumText);
  }

  private simulate(): void {
    const request: CollaborateRequest = mockRequest(this.indexText);
    this.accepted = request.accepted;
    this.requestText = summarizeRequest(request);
    const code = request.accepted ? COLLABORATE_ACCEPT : COLLABORATE_REJECT;
    this.resultText = collaborateResultName(code);
    Logger.record(request.accepted ? LogLevel.INFO : LogLevel.WARN, SOURCE, 'onCollaborate', this.requestText);
  }

  private goBack(): void {
    if (this.navPathStack.size() === 0) {
      return;
    }
    this.navPathStack.pop();
  }

  @Builder
  header() {
    Column({ space: AppSpacing.XS }) {
      Row({ space: AppSpacing.MD }) {
        Button($r('app.string.demo_back'))
          .fontSize(AppText.BODY)
          .height(30)
          .backgroundColor(AppColors.PRIMARY_SOFT)
          .fontColor(AppColors.PRIMARY)
          .onClick(() => {
            this.goBack();
          })
        Text(titleText(this.meta))
          .fontSize(AppText.DISPLAY)
          .fontWeight(FontWeight.Bold)
          .fontColor(AppColors.TEXT_PRIMARY)
          .layoutWeight(1)
        StatusChip({
          text: this.extensionDeclared ? text('ext_registered') : text('ext_not_found'),
          tone: this.extensionDeclared ? WidgetTone.SUCCESS : WidgetTone.DANGER
        })
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)

      Text(`${this.meta.apiName} · ${this.meta.interfaceName}`)
        .fontSize(AppText.SMALL)
        .fontColor(AppColors.TEXT_TERTIARY)
        .width('100%')
    }
    .width('100%')
    .padding({ left: AppSpacing.PAGE, right: AppSpacing.PAGE, top: AppSpacing.XL, bottom: AppSpacing.MD })
    .backgroundColor(AppColors.CARD_BG)
  }

  @Builder
  statusCard() {
    SectionCard({ title: text('ext_card_status'), subtitle: text('ext_card_status_sub') }) {
      Column({ space: AppSpacing.SM }) {
        KeyValueRow({ label: text('ext_label_registration'), value: this.extensionText })
        KeyValueRow({
          label: text('ext_label_syscap'),
          value: this.syscapText,
          valueColor: this.syscapSupported ? AppColors.SUCCESS : AppColors.DANGER
        })
        KeyValueRow({ label: text('ext_label_enum'), value: this.enumText })
        KeyValueRow({ label: text('ext_label_declared_at'), value: text('ext_value_declared_at') })
        KeyValueRow({
          label: text('ext_label_context'),
          value: text('ext_value_context')
        })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  actionCard() {
    SectionCard({ title: text('ext_card_action'), subtitle: text('ext_card_action_sub') }) {
      Column({ space: AppSpacing.LG }) {
        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: text('ext_btn_read_extension'),
            onAction: () => {
              this.readExtension();
            }
          })
          ActionButton({
            label: text('ext_btn_read_syscap'),
            tone: WidgetTone.SUCCESS,
            onAction: () => {
              this.readSyscap();
            }
          })
          ActionButton({
            label: text('ext_btn_read_enum'),
            tone: WidgetTone.WARNING,
            onAction: () => {
              this.readEnums();
            }
          })
        }
        .width('100%')

        Text(text('ext_action_note'))
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  collaborateCard() {
    SectionCard({ title: text('ext_card_collab'), subtitle: text('ext_card_collab_sub') }) {
      Column({ space: AppSpacing.MD }) {
        Text(text('ext_collab_param'))
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_TERTIARY)
          .width('100%')
        TextInput({ placeholder: text('ext_collab_hint'), text: this.indexText })
          .fontSize(AppText.BODY)
          .height(34)
          .backgroundColor(AppColors.SUBTLE_BG)
          .onChange((value: string) => {
            this.indexText = value;
          })

        Row({ space: AppSpacing.MD }) {
          ActionButton({
            label: text('ext_btn_simulate'),
            onAction: () => {
              this.simulate();
            }
          })
          ActionButton({
            label: text('ext_btn_clear_index'),
            tone: WidgetTone.NEUTRAL,
            onAction: () => {
              this.indexText = '';
            }
          })
        }
        .width('100%')

        KeyValueRow({ label: text('ext_label_request'), value: this.requestText })
        KeyValueRow({
          label: text('ext_label_result'),
          value: this.resultText,
          valueColor: this.accepted ? AppColors.SUCCESS : AppColors.WARNING
        })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  @Builder
  noteCard() {
    SectionCard({ title: text('ext_card_note'), subtitle: text('ext_card_note_sub') }) {
      Column({ space: AppSpacing.SM }) {
        Text(summaryText(this.meta))
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_SECONDARY)
          .width('100%')
        Text(noteText(this.meta))
          .fontSize(AppText.SMALL)
          .fontColor(AppColors.TEXT_TERTIARY)
          .width('100%')
        Text(text('ext_note_body'))
          .fontSize(AppText.CAPTION)
          .fontColor(AppColors.TEXT_MUTED)
          .width('100%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
    }
  }

  build() {
    Column() {
      this.header()
      Scroll() {
        Column({ space: AppSpacing.XL }) {
          this.statusCard()
          this.actionCard()
          this.collaborateCard()
          this.noteCard()
          LogPanel({ title: $r('app.string.log_title_extension'), filterSource: SOURCE, maxItems: PAGE_LOG_LIMIT })
        }
        .width('100%')
        .padding({ left: AppSpacing.PAGE, right: AppSpacing.PAGE, bottom: AppSpacing.PAGE })
      }
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Auto)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(AppColors.PAGE_BG)
  }
}
