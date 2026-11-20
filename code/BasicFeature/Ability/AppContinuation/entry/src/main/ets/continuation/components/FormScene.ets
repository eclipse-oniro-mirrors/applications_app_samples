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

import { localize } from '../../common/LocaleStrings';
import { getLearningController } from '../../learning/LearningContext';
import { LearningController } from '../../learning/LearningController';
import { SceneSnapshot } from '../../learning/scene/SceneWorkbench';
import { ScenePageSession } from '../../learning/scene/ScenePageSession';
import { FORM_STEPS } from '../../learning/scene/SceneModel';
import { SceneContinuationStatus } from '../../components/SceneContinuationStatus';
import { LEARNING_BG, LEARNING_BLUE, LEARNING_INK, LEARNING_MUTED, openLearningTab } from '../../components/LearningUi';

@Component
export struct FormScene {
  controller: LearningController | undefined = undefined;
  private currentController(): LearningController | undefined {
    return this.controller === undefined ? getLearningController() : this.controller;
  }
  @Prop @Watch('visibilityChanged') pageVisible: boolean = true;
  @State private view: SceneSnapshot = new SceneSnapshot();
  @State private navigationMessage: string = '';
  private readonly binding: ScenePageSession = new ScenePageSession('form');
  private receiptRequest: number = -1;
  aboutToAppear(): void { this.bind(); }
  private visibilityChanged(): void {
    if (this.pageVisible) { this.bind(); } else { this.binding.hide(); }
  }
  aboutToDisappear(): void { this.binding.hide(); }
  private bind(): void {
    this.binding.bind(this.currentController(), (): void => { this.view = this.binding.snapshot(); });
  }
  private positionRendered(): void {
    const target = this.binding.target();
    if (target === undefined || target.document.state.kind !== 'form' || target.request === this.receiptRequest ||
      this.view.formStep !== target.document.state.form.step) { return; }
    this.receiptRequest = target.request;
    this.binding.receipt(target, this.view.formStep, 0, true);
  }
  private edit(field: string, value: string): void {
    if (this.view.editable) { this.currentController()?.sceneWorkbench.setFormField(field, value); }
  }
  private backToWorkbench(): void {
    this.navigationMessage = '';
    openLearningTab(this.getUIContext(), 1, (message: string): void => { this.navigationMessage = message; });
  }
  build() {
    Scroll() {
      Column({ space: 14 }) {
        Button($r('app.string.ac_formscenepage_001'), { type: ButtonType.Normal })
          .height(44)
          .fontSize(14)
          .fontColor(LEARNING_BLUE)
          .backgroundColor('#EEF4FF')
          .borderRadius(10)
          .onClick((): void => { this.backToWorkbench(); })
        if (this.navigationMessage.length > 0) {
          Text(this.navigationMessage)
            .fontSize(14)
            .fontColor('#B42318')
            .width('100%')
        }
        Text($r('app.string.ac_formscenepage_002'))
          .fontSize(26)
          .fontWeight(FontWeight.Bold)
          .fontColor(LEARNING_INK)
          .width('100%')
        Text(this.view.text())
          .fontSize(14)
          .fontColor(LEARNING_MUTED)
          .width('100%')
        SceneContinuationStatus({ controller: this.currentController() })
        Row({ space: 8 }) {
          ForEach(FORM_STEPS, (label: string, index: number) => {
            Button(`${index + 1}. ${label}`, { type: ButtonType.Normal })
              .layoutWeight(1)
              .height(44)
              .fontSize(13)
              .fontColor(this.view.formStep === index ? '#FFFFFF' : LEARNING_BLUE)
              .backgroundColor(this.view.formStep === index ? LEARNING_BLUE : '#EEF4FF')
              .borderRadius(10)
              .enabled(this.view.editable)
              .onClick((): void => { this.currentController()?.sceneWorkbench.gotoFormStep(index); })
          }, (label: string) => label)
        }
        .width('100%')
        Column({ space: 12 }) {
          Text(localize('ac_formscenepage_003', [this.view.formStep + 1, this.view.formStepLabel]))
            .id('ACFormStepLabel')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor(LEARNING_INK)
            .width('100%')
          if (this.view.formStep === 0) {
            TextInput({ text: this.view.formName, placeholder: $r('app.string.ac_formscenepage_004') })
              .id('ACFormName')
              .maxLength(40)
              .height(48)
              .fontSize(15)
              .backgroundColor(LEARNING_BG)
              .borderRadius(10)
              .enabled(this.view.editable)
              .onChange((value: string): void => this.edit('name', value))
            TextInput({ text: this.view.formPhone, placeholder: $r('app.string.ac_formscenepage_005') })
              .id('ACFormPhone')
              .maxLength(20)
              .height(48)
              .fontSize(15)
              .backgroundColor(LEARNING_BG)
              .borderRadius(10)
              .enabled(this.view.editable)
              .onChange((value: string): void => this.edit('phone', value))
          } else if (this.view.formStep === 1) {
            TextArea({ text: this.view.formAddress, placeholder: $r('app.string.ac_formscenepage_006') })
              .id('ACFormAddress')
              .height(120)
              .maxLength(100)
              .fontSize(15)
              .backgroundColor(LEARNING_BG)
              .borderRadius(10)
              .enabled(this.view.editable)
              .onChange((value: string): void => this.edit('address', value))
          } else {
            TextArea({ text: this.view.formNote, placeholder: $r('app.string.ac_formscenepage_007') })
              .height(100)
              .maxLength(200)
              .fontSize(15)
              .backgroundColor(LEARNING_BG)
              .borderRadius(10)
              .enabled(this.view.editable)
              .onChange((value: string): void => this.edit('note', value))
            Row({ space: 8 }) {
              Checkbox({ name: 'verified' })
                .width(44)
                .height(44)
                .padding(10)
                .select(this.view.formAgreed)
                .enabled(this.view.editable)
                .onChange((value: boolean): void => {
                  if (this.view.editable) {
                    this.currentController()?.sceneWorkbench.setFormAgreed(value);
                  }
                })
              Text($r('app.string.ac_formscenepage_008'))
                .fontSize(14)
                .fontColor(LEARNING_INK)
            }
            .width('100%')
          }
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#FFFFFF')
        .borderRadius(14)
          .onAreaChange((_old, area): void => {
            if (Number(area.width) > 0 && Number(area.height) > 0) {
              this.positionRendered();
            }
          })
        Text(localize('ac_formscenepage_009', [this.view.formStepIssues.length > 0 ? this.view.formStepIssues.join('；') : localize('ac_formscenepage_010')]))
          .id('ACFormIssues')
          .fontSize(13)
          .fontColor(LEARNING_INK)
          .width('100%')
        Text(localize('ac_formscenepage_011', [this.view.formIssues.length]))
          .fontSize(12)
          .fontColor(LEARNING_MUTED)
          .width('100%')
        Row({ space: 10 }) {
          Button($r('app.string.ac_formscenepage_012'), { type: ButtonType.Normal })
            .id('ACFormPreviousStep')
            .layoutWeight(1)
            .height(44)
            .fontSize(14)
            .fontColor(LEARNING_BLUE)
            .backgroundColor('#EEF4FF')
            .borderRadius(10)
            .enabled(this.view.editable)
            .onClick((): void => { this.currentController()?.sceneWorkbench.previousFormStep(); })
          Button($r('app.string.ac_formscenepage_013'), { type: ButtonType.Normal })
            .id('ACFormNextStep')
            .layoutWeight(1)
            .height(44)
            .fontSize(14)
            .fontColor(LEARNING_BLUE)
            .backgroundColor('#EEF4FF')
            .borderRadius(10)
            .enabled(this.view.editable)
            .onClick((): void => { this.currentController()?.sceneWorkbench.nextFormStep(); })
        }
        .width('100%')
        Button($r('app.string.ac_formscenepage_014'))
          .id('ACFormSave')
          .width('100%')
          .height(48)
          .fontSize(15)
          .backgroundColor(LEARNING_BLUE)
          .borderRadius(10)
          .enabled(this.view.editable)
          .onClick((): void => { this.currentController()?.sceneWorkbench.saveForm(); })
        Button($r('app.string.ac_formscenepage_015'), { type: ButtonType.Normal })
          .width('100%')
          .height(44)
          .fontSize(14)
          .fontColor(LEARNING_BLUE)
          .backgroundColor('#EEF4FF')
          .borderRadius(10)
          .enabled(this.view.editable)
          .onClick((): void => { this.currentController()?.sceneWorkbench.confirmForm(); })
        Text(this.view.formConfirmed ? $r('app.string.ac_formscenepage_016') : $r('app.string.ac_formscenepage_017'))
          .fontSize(13)
          .fontColor(LEARNING_INK)
          .width('100%')
        Text(this.view.error.length > 0 ? this.view.error : this.view.notice)
          .fontSize(14)
          .fontColor(LEARNING_INK)
          .width('100%')
      }
      .width('100%')
      .padding(20)
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .backgroundColor(LEARNING_BG)
    .align(Alignment.TopStart)
  }
}
