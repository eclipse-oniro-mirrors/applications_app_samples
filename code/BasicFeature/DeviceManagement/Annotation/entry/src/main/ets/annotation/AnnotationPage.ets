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

import {
  AnnotationService,
  AVAILABLE_MIN_API_VERSION,
  FUTURE_DEMO_API_VERSION,
  logger,
  SUPPRESS_ANNOTATION_SINCE_API_VERSION
} from '@ohos/annotation';

@Component
export struct AnnotationPage {
  @State private apiVersion: number = 0;
  @State private sourceText: Resource = $r('app.string.local_data');
  @State private availableResult: Resource = $r('app.string.not_run');
  @State private suppressResult: Resource = $r('app.string.not_run');
  @State private suppressionRules: string = '';
  @State private isMock: boolean = false;

  aboutToAppear(): void {
    this.suppressionRules = AnnotationService.getSuppressionRules().join(', ');
    this.showLocalEnvironment();
  }

  private updateEnvironment(apiVersion: number, isMock: boolean): void {
    this.apiVersion = apiVersion;
    this.isMock = isMock;
    this.sourceText = isMock ? $r('app.string.mock_data') : $r('app.string.local_data');
    this.availableResult = $r('app.string.not_run');
    this.suppressResult = $r('app.string.not_run');
  }

  private showLocalEnvironment(): void {
    this.updateEnvironment(AnnotationService.getLocalApiVersion(), false);
    logger.info(`Local API version: ${this.apiVersion}`);
  }

  private showMockEnvironment(): void {
    this.updateEnvironment(AnnotationService.getMockApiVersion(), true);
    logger.info(`Mock API version: ${this.apiVersion}`);
  }

  private refreshEnvironment(): void {
    if (this.isMock) {
      this.showMockEnvironment();
      return;
    }
    this.showLocalEnvironment();
  }

  private runAvailableAnnotation(): void {
    const executed = this.isMock ? AnnotationService.runMockAvailableDemo() : AnnotationService.runAvailableDemo();
    this.availableResult = executed ? $r('app.string.executed') : $r('app.string.fallback');
    logger.info(`Available annotation executed: ${executed}`);
  }

  private runSuppressAnnotation(): void {
    const executed = this.isMock ? AnnotationService.runMockSuppressWarningsDemo() :
      AnnotationService.runSuppressWarningsDemo();
    this.suppressResult = executed ? $r('app.string.executed') : $r('app.string.fallback');
    logger.info(`SuppressWarnings annotation executed: ${executed}`);
  }

  build() {
    Scroll() {
      Column() {
        Text($r('app.string.annotation_title'))
          .id('annotation_title')
          .width('100%')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.primary_text'))
        Text($r('app.string.annotation_subtitle'))
          .width('100%')
          .fontSize(14)
          .fontColor($r('app.color.secondary_text'))
          .margin({ top: 8 })

        Row() {
          Button($r('app.string.local_data'))
            .id('local_data_button')
            .type(ButtonType.Capsule)
            .layoutWeight(1)
            .height(40)
            .fontSize(14)
            .fontColor(this.isMock ? $r('app.color.accent') : $r('app.color.button_text'))
            .backgroundColor(this.isMock ? $r('app.color.unselected_background') : $r('app.color.accent'))
            .onClick(() => {
              this.showLocalEnvironment();
            })
          Button($r('app.string.mock_data'))
            .id('mock_data_button')
            .type(ButtonType.Capsule)
            .layoutWeight(1)
            .height(40)
            .fontSize(14)
            .fontColor(this.isMock ? $r('app.color.button_text') : $r('app.color.accent'))
            .backgroundColor(this.isMock ? $r('app.color.accent') : $r('app.color.unselected_background'))
            .margin({ left: 8 })
            .onClick(() => {
              this.showMockEnvironment();
            })
          Button($r('app.string.refresh'))
            .id('refresh_button')
            .type(ButtonType.Capsule)
            .width(72)
            .height(40)
            .fontSize(14)
            .fontColor($r('app.color.button_text'))
            .backgroundColor($r('app.color.accent'))
            .margin({ left: 8 })
            .onClick(() => {
              this.refreshEnvironment();
            })
        }
        .width('100%')
        .margin({ top: 24 })

        Column() {
          Text($r('app.string.environment_title'))
            .width('100%')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.primary_text'))
          Row() {
            Text($r('app.string.api_version_label'))
              .fontSize(14)
              .fontColor($r('app.color.secondary_text'))
            Text(this.apiVersion.toString())
              .id('api_version_value')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .fontColor($r('app.color.accent'))
              .margin({ left: 8 })
          }
          .width('100%')
          .margin({ top: 16 })
          Row() {
            Text($r('app.string.data_source'))
              .fontSize(14)
              .fontColor($r('app.color.secondary_text'))
            Text(this.sourceText)
              .id('data_source_text')
              .fontSize(14)
              .fontColor($r('app.color.primary_text'))
              .margin({ left: 8 })
          }
          .width('100%')
          .margin({ top: 12 })
        }
        .id('annotation_environment_card')
        .width('100%')
        .padding(20)
        .margin({ top: 20 })
        .backgroundColor($r('app.color.card_background'))
        .borderRadius(16)

        Column() {
          Text($r('app.string.available_annotation_name'))
            .width('100%')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.primary_text'))
          Text($r('app.string.available_description'))
            .width('100%')
            .fontSize(14)
            .fontColor($r('app.color.secondary_text'))
            .margin({ top: 12 })
          Row() {
            Text($r('app.string.minimum_api_label'))
              .fontSize(14)
              .fontColor($r('app.color.secondary_text'))
            Text(AVAILABLE_MIN_API_VERSION.toString())
              .id('available_min_api')
              .fontSize(16)
              .fontColor($r('app.color.primary_text'))
              .margin({ left: 8 })
          }
          .width('100%')
          .margin({ top: 16 })
          Text(this.availableResult)
            .id('available_status')
            .width('100%')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.accent'))
            .margin({ top: 16 })
          Button($r('app.string.run_example'))
            .id('available_run_button')
            .type(ButtonType.Capsule)
            .width('100%')
            .height(40)
            .fontSize(14)
            .fontColor($r('app.color.button_text'))
            .backgroundColor($r('app.color.accent'))
            .margin({ top: 16 })
            .onClick(() => {
              this.runAvailableAnnotation();
            })
        }
        .id('available_card')
        .width('100%')
        .padding(20)
        .margin({ top: 16 })
        .backgroundColor($r('app.color.card_background'))
        .borderRadius(16)

        Column() {
          Text($r('app.string.suppress_annotation_name'))
            .width('100%')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.primary_text'))
          Text($r('app.string.suppress_description'))
            .width('100%')
            .fontSize(14)
            .fontColor($r('app.color.secondary_text'))
            .margin({ top: 12 })
          Row() {
            Text($r('app.string.annotation_since_label'))
              .fontSize(14)
              .fontColor($r('app.color.secondary_text'))
            Text(SUPPRESS_ANNOTATION_SINCE_API_VERSION.toString())
              .id('suppress_annotation_since')
              .fontSize(16)
              .fontColor($r('app.color.primary_text'))
              .margin({ left: 8 })
          }
          .width('100%')
          .margin({ top: 16 })
          Row() {
            Text($r('app.string.demo_api_label'))
              .fontSize(14)
              .fontColor($r('app.color.secondary_text'))
            Text(FUTURE_DEMO_API_VERSION.toString())
              .id('suppress_demo_api')
              .fontSize(16)
              .fontColor($r('app.color.primary_text'))
              .margin({ left: 8 })
          }
          .width('100%')
          .margin({ top: 12 })
          Row() {
            Text($r('app.string.suppression_rules_label'))
              .fontSize(14)
              .fontColor($r('app.color.secondary_text'))
            Text(this.suppressionRules)
              .id('suppression_rules')
              .layoutWeight(1)
              .fontSize(14)
              .fontColor($r('app.color.primary_text'))
              .margin({ left: 8 })
          }
          .width('100%')
          .margin({ top: 12 })
          Text(this.suppressResult)
            .id('suppress_status')
            .width('100%')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.accent'))
            .margin({ top: 16 })
          Button($r('app.string.run_example'))
            .id('suppress_run_button')
            .type(ButtonType.Capsule)
            .width('100%')
            .height(40)
            .fontSize(14)
            .fontColor($r('app.color.button_text'))
            .backgroundColor($r('app.color.accent'))
            .margin({ top: 16 })
            .onClick(() => {
              this.runSuppressAnnotation();
            })
        }
        .id('suppress_card')
        .width('100%')
        .padding(20)
        .margin({ top: 16 })
        .backgroundColor($r('app.color.card_background'))
        .borderRadius(16)
      }
      .id('annotation_page')
      .width('100%')
      .padding({ left: 20, right: 20, top: 32, bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
    .scrollBar(BarState.Auto)
    .backgroundColor($r('app.color.page_background'))
  }
}
