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

import { localize } from '../common/LocaleStrings';
/** Presentational pieces for the API learning pages. No platform continuation calls live here. */
import { promptAction, UIContext } from '@kit.ArkUI';
import { BusinessError, pasteboard } from '@kit.BasicServicesKit';
import { DiagnosticEvent, EnvironmentItem, OperationRecord } from '../learning/LearningTypes';

export const LEARNING_BG: string = '#F5F7FA';
export const LEARNING_INK: string = '#182238';
export const LEARNING_MUTED: string = '#667085';
export const LEARNING_BLUE: string = '#2563EB';
export const LEARNING_TEAL: string = '#237A57';
export const LEARNING_BORDER: string = '#E4E7EC';

export function learningError(error: BusinessError): string {
  return `${error.code}: ${error.message}`;
}

export function learningLevel(level: string): string {
  if (level === 'ERROR') {
    return localize('ac_learningui_001');
  }
  if (level === 'WARN') {
    return localize('ac_learningui_002');
  }
  return localize('ac_learningui_003');
}

export function learningLevelColor(level: string): string {
  if (level === 'ERROR') {
    return '#A32B36';
  }
  if (level === 'WARN') {
    return '#805000';
  }
  return LEARNING_TEAL;
}

/** Copy only strings explicitly supplied by the page; never read clipboard or business text. */
export function copyLearningText(text: string, feedback: (message: string) => void): void {
  try {
    const data = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, text);
    pasteboard.getSystemPasteboard().setData(data).then(() => {
      feedback(localize('ac_learningui_004'));
    }).catch((error: BusinessError) => {
      feedback(localize('ac_learningui_005', [learningError(error)]));
    });
  } catch (error) {
    feedback(localize('ac_learningui_006', [learningError(error as BusinessError)]));
  }
}

/** An action runs only after the user explicitly chooses the second dialog button. */
export function confirmLearningAction(context: UIContext, title: string, message: string,
  action: () => void, feedback: (message: string) => void): void {
  try {
    context.getPromptAction().showDialog({
      title: title,
      message: message,
      buttons: [
        { text: localize('ac_learningui_007'), color: LEARNING_MUTED },
        { text: localize('ac_learningui_008'), color: LEARNING_BLUE }
      ]
    }).then((answer: promptAction.ShowDialogSuccessResponse) => {
      if (answer.index === 1) {
        action();
      } else {
        feedback(localize('ac_learningui_009'));
      }
    }).catch((error: BusinessError) => {
      feedback(localize('ac_learningui_010', [learningError(error)]));
    });
  } catch (error) {
    feedback(localize('ac_learningui_011', [learningError(error as BusinessError)]));
  }
}

interface LearningTabParams {
  tab: number;
  returnRequest: string;
}

/** Reuse the existing home page; never grow a chain of duplicate Index pages. */
export function openLearningTab(context: UIContext, tab: number, feedback: (message: string) => void): void {
  try {
    const navigation = context.getRouter();
    const params: LearningTabParams = { tab: tab, returnRequest: `${Date.now()}-${tab}` };
    if (navigation.getStateByUrl('pages/Index').length > 0) {
      navigation.back({ url: 'pages/Index', params: params });
    } else {
      navigation.replaceUrl({ url: 'pages/Index', params: params }).catch((error: BusinessError) => {
        feedback(localize('ac_learningui_012', [learningError(error)]));
      });
    }
  } catch (error) {
    feedback(localize('ac_learningui_013', [learningError(error as BusinessError)]));
  }
}

/** Deliberately excludes text and device identifiers. Environment is shown separately. */
export function rawLearningRecord(record: OperationRecord): string {
  return [
    localize('ac_learningui_014'),
    `operationId=${record.id}`,
    `operation=${record.operation}`,
    `stage=${record.stage}`,
    `result=${record.result}`,
    `level=${record.level}`,
    `startedAt=${record.startedAt}`,
    `endedAt=${record.endedAt}`,
    `errorCode=${record.errorCode}`,
    `rawMessage=${record.rawMessage}`,
    `rawResultState=${record.rawResultState}`,
    `resultInfo=${record.resultInfo}`
  ].join('\n');
}

@Component
export struct LearningHeader {
  @Prop eyebrow: string = '';
  @Prop title: string = '';
  @Prop description: string = '';

  build() {
    Column({ space: 8 }) {
      if (this.eyebrow.length > 0) {
        Text(this.eyebrow).fontSize(11).fontWeight(FontWeight.Medium)
          .fontColor(LEARNING_TEAL).letterSpacing(1).width('100%');
      }
      Text(this.title).fontSize(26).fontWeight(FontWeight.Bold).fontColor(LEARNING_INK).width('100%');
      if (this.description.length > 0) {
        Text(this.description).fontSize(14).lineHeight(22).fontColor(LEARNING_MUTED).width('100%');
      }
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .padding({ top: 12, bottom: 10 });
  }
}

@Component
export struct LearningCard {
  @Prop title: string = '';
  @Prop subtitle: string = '';
  @BuilderParam content: () => void;

  build() {
    Column({ space: 12 }) {
      Text(this.title).fontSize(16).fontWeight(FontWeight.Bold).fontColor(LEARNING_INK).width('100%');
      if (this.subtitle.length > 0) {
        Text(this.subtitle).fontSize(13).lineHeight(21).fontColor(LEARNING_MUTED).width('100%');
      }
      this.content()
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .padding(16)
    .backgroundColor('#FFFFFF')
    .borderRadius(14)
    .border({ width: 1, color: LEARNING_BORDER });
  }
}

@Component
export struct LearningDisclosure {
  @Prop title: string = '';
  @Prop subtitle: string = '';
  @State private expanded: boolean = false;
  @BuilderParam content: () => void;

  build() {
    Column({ space: 12 }) {
      Button({ type: ButtonType.Normal }) {
        Row({ space: 12 }) {
          Text(this.title).fontSize(16).fontWeight(FontWeight.Medium).fontColor(LEARNING_INK).layoutWeight(1)
          Text(this.expanded ? localize('ac_learningui_015') : localize('ac_learningui_016')).fontSize(14).fontColor(LEARNING_BLUE)
        }.width('100%')
      }.width('100%').constraintSize({ minHeight: 44 }).backgroundColor('#FFFFFF')
        .onClick((): void => { this.expanded = !this.expanded; })
      if (this.subtitle.length > 0) {
        Text(this.subtitle).fontSize(13).lineHeight(21).fontColor(LEARNING_MUTED).width('100%')
      }
      if (this.expanded) { this.content() }
    }.width('100%').padding(16).backgroundColor('#FFFFFF').borderRadius(14)
      .border({ width: 1, color: LEARNING_BORDER })
  }
}

@Component
export struct LearningNotice {
  @Prop message: string = '';
  @Prop title: string = localize('ac_learningui_017');

  build() {
    if (this.message.length > 0) {
      Column({ space: 5 }) {
        if (this.title.length > 0 && this.title !== localize('ac_learningui_017')) {
          Text(this.title).fontSize(13).fontWeight(FontWeight.Bold).fontColor(LEARNING_BLUE).width('100%');
        }
        Text(this.message).fontSize(14).lineHeight(22).fontColor(LEARNING_INK).width('100%');
      }
      .alignItems(HorizontalAlign.Start)
      .padding(14)
      .width('100%')
      .backgroundColor('#EEF4FF')
      .borderRadius(12)
      .accessibilityText(`${this.title}：${this.message}`);
    }
  }
}

@Component
export struct LearningLine {
  @Prop label: string = '';
  @Prop value: string = '';

  build() {
    Column({ space: 3 }) {
      Text(this.label).fontSize(12).fontColor(LEARNING_MUTED).width('100%');
      Text(this.value.length > 0 ? this.value : localize('ac_learningui_019'))
        .fontSize(14).lineHeight(22).fontColor(LEARNING_INK).width('100%')
        .copyOption(CopyOptions.LocalDevice);
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%');
  }
}

@Component
export struct LearningAction {
  @Prop label: string = '';
  @Prop secondary: boolean = false;
  @Prop actionEnabled: boolean = true;
  onTap: () => void = () => {};

  build() {
    Button(this.label, { type: ButtonType.Normal })
      .width('100%')
      .constraintSize({ minHeight: 48 })
      .padding({ top: 12, bottom: 12, left: 14, right: 14 })
      .borderRadius(12)
      .fontSize(15)
      .fontWeight(FontWeight.Medium)
      .fontColor(this.secondary ? LEARNING_BLUE : '#FFFFFF')
      .backgroundColor(this.secondary ? '#EEF4FF' : LEARNING_BLUE)
      .opacity(this.actionEnabled ? 1 : 0.45)
      .enabled(this.actionEnabled)
      .onClick(() => this.onTap());
  }
}

@Component
export struct LearningFacts {
  @Prop title: string = '';
  @Prop lines: string[] = [];

  build() {
    Column({ space: 6 }) {
      Text(this.title).fontSize(14).fontWeight(FontWeight.Bold).fontColor(LEARNING_TEAL).width('100%');
      if (this.lines.length === 0) {
        Text($r('app.string.ac_learningui_020')).fontSize(14).fontColor(LEARNING_MUTED).width('100%');
      } else {
        ForEach(this.lines, (line: string) => {
          Text(`• ${line}`).fontSize(14).lineHeight(22).fontColor(LEARNING_INK).width('100%');
        }, (line: string, index: number) => `${index}-${line}`)
      }
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%');
  }
}

@Component
export struct LearningEnvironment {
  @Prop items: EnvironmentItem[] = [];

  build() {
    Column({ space: 12 }) {
      if (this.items.length === 0) {
        Text($r('app.string.ac_learningui_021'))
          .fontSize(14).lineHeight(22).fontColor(LEARNING_MUTED).width('100%');
      } else {
        ForEach(this.items, (item: EnvironmentItem) => {
          Column({ space: 4 }) {
            Text(`${item.label} · ${item.status}`).fontSize(14).fontWeight(FontWeight.Medium)
              .fontColor(LEARNING_INK).width('100%');
            Text(item.value).fontSize(14).lineHeight(22).fontColor(LEARNING_INK).width('100%');
          }
          .alignItems(HorizontalAlign.Start)
          .width('100%')
          .padding(12)
          .backgroundColor('#F5F7FA')
          .borderRadius(10);
        }, (item: EnvironmentItem) => item.key)
      }
    }
    .width('100%');
  }
}

@Component
export struct LearningEvents {
  @Prop events: DiagnosticEvent[] = [];

  build() {
    Column({ space: 12 }) {
      if (this.events.length === 0) {
        Text($r('app.string.ac_learningui_022'))
          .fontSize(14).lineHeight(22).fontColor(LEARNING_MUTED).width('100%');
      } else {
        ForEach(this.events.slice(-40).reverse(), (event: DiagnosticEvent) => {
          Column({ space: 4 }) {
            Text(`${learningLevel(event.level)} · ${event.phase}`)
              .fontSize(12).fontWeight(FontWeight.Bold).fontColor(learningLevelColor(event.level)).width('100%');
            Text(event.message).fontSize(14).lineHeight(22).fontColor(LEARNING_INK).width('100%');
            Text(`${event.time}  /  ${event.operationId}`)
              .fontSize(11).fontColor(LEARNING_MUTED).width('100%');
          }
          .alignItems(HorizontalAlign.Start)
          .width('100%')
          .padding({ bottom: 10 })
          .border({ width: { bottom: 1 }, color: LEARNING_BORDER });
        }, (event: DiagnosticEvent) => `${event.operationId}-${event.seq}`)
      }
    }
    .width('100%');
  }
}

@Component
export struct LearningRecord {
  @Prop record: OperationRecord;
  onOpen: () => void = () => {};

  build() {
    Column({ space: 7 }) {
      Text(`${learningLevel(this.record.level)} · ${this.record.operation}`)
        .fontSize(12).fontWeight(FontWeight.Bold).fontColor(learningLevelColor(this.record.level)).width('100%');
      Text(this.record.title).fontSize(16).fontWeight(FontWeight.Bold).fontColor(LEARNING_INK).width('100%');
      Text(this.record.result).fontSize(14).lineHeight(22).fontColor(LEARNING_INK).width('100%');
      Text(`${this.record.startedAt} · ${this.record.stage}`)
        .fontSize(12).lineHeight(19).fontColor(LEARNING_MUTED).width('100%');
      LearningAction({ label: localize('ac_learningui_023'), secondary: true, onTap: () => this.onOpen() })
    }
    .alignItems(HorizontalAlign.Start)
    .width('100%')
    .padding(14)
    .backgroundColor('#F5F7FA')
    .borderRadius(12);
  }
}
