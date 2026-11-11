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
import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { getLearningController } from '../learning/LearningContext';
import { LearningDisclosure, learningError } from '../components/LearningUi';
import {
  PayloadShape, SCENARIO_CATALOG, ScenarioEntry, auditScenarios, deviceCoverageLines,
  highRiskScenarios, scenarioLines, scenarioStepLines, shapeCoverageLines, summarizeScenarios
} from '../learning/guide/ScenarioCatalog';
import {
  CROSS_RULES, FIELD_RULES, auditValidator, crossRuleLines, fieldRuleLines, validate
} from '../learning/payload/PayloadValidator';
import { PayloadData, encodePayload, sealPayload, sizeOf } from '../learning/payload/PayloadCodec';
import { PAYLOAD_VERSION } from '../learning/payload/PayloadSchema';
import {
  FIELD_DOCS, auditDictionary, describeValue, dictionaryLines, missingSchemaKeys, roleLines
} from '../learning/payload/FieldDictionary';
import {
  RetryReason, auditRetryRules, defaultRule, delayOf, reasonLines, ruleLines, simulate,
  totalWait
} from '../learning/session/RetryPolicy';

@Entry
@Component
struct ScenarioPage {
  @State private scenarioLinesState: string[] = [];
  @State private stepLinesState: string[] = [];
  @State private validatorLinesState: string[] = [];
  @State private sampleLinesState: string[] = [];
  @State private dictionaryLinesState: string[] = [];
  @State private retryLinesState: string[] = [];
  @State private headline: string = '';
  @State private navigationMessage: string = '';

  aboutToAppear(): void {
    this.rebuild();
  }

  onPageShow(): void {
    this.rebuild();
  }

  private samplePayload(): PayloadData {
    const data: PayloadData = new PayloadData('scenario-doc', 3);
    data.title = localize('ac_index_150');
    data.body = localize('ac_index_151');
    data.cs = 2;
    data.ce = 8;
    data.dev = 'local-device';
    data.at = 1700000000000;
    data.app = '1.0.0';
    return sealPayload(data);
  }

  private rebuild(): void {
    const summary = summarizeScenarios();
    this.headline = `${summary.text()}｜${auditScenarios().summary()}`;
    const lines: string[] = scenarioLines();
    shapeCoverageLines().forEach((line: string): void => {
      lines.push(line);
    });
    deviceCoverageLines().forEach((line: string): void => {
      lines.push(line);
    });
    lines.push(localize('ac_scenariopage_003', [highRiskScenarios().length]));
    this.scenarioLinesState = lines;
    this.stepLinesState = scenarioStepLines();

    const validator: string[] = fieldRuleLines();
    crossRuleLines().forEach((line: string): void => {
      validator.push(line);
    });
    validator.push(auditValidator().summary());
    validator.push(localize('ac_scenariopage_004', [FIELD_RULES.length, CROSS_RULES.length]));
    this.validatorLinesState = validator;

    const sample: PayloadData = this.samplePayload();
    const result = validate(sample, Date.now());
    const sampleLines: string[] = [];
    sampleLines.push(localize('ac_scenariopage_005', [PAYLOAD_VERSION, encodePayload(sample).length]));
    sampleLines.push(sizeOf(sample).text());
    sampleLines.push(localize('ac_scenariopage_006', [result.headline()]));
    result.violations.forEach((violation): void => {
      sampleLines.push(violation.text());
    });
    sampleLines.push(localize('ac_scenariopage_007', [SCENARIO_CATALOG.length, PayloadShape.NOTE as string]));
    this.sampleLinesState = sampleLines;

    const dictionary: string[] = dictionaryLines();
    roleLines().forEach((line: string): void => {
      dictionary.push(line);
    });
    ['doc', 'title', 'body', 'ck', 'bodyLength', 'selectionLength', 'conflictText'].forEach(
      (key: string): void => {
        dictionary.push(describeValue(sample, key));
      });
    dictionary.push(localize('ac_scenariopage_008', [FIELD_DOCS.length, missingSchemaKeys().length]));
    dictionary.push(auditDictionary().summary());
    this.dictionaryLinesState = dictionary;

    const retry: string[] = [];
    reasonLines().forEach((line: string): void => {
      retry.push(line);
    });
    ruleLines().forEach((line: string): void => {
      retry.push(line);
    });
    const network = defaultRule(RetryReason.NETWORK);
    retry.push(localize('ac_scenariopage_009', [delayOf(network, 1), delayOf(network, 2)]) +
      localize('ac_scenariopage_010', [totalWait(network)]));
    const trace = simulate(network, 3);
    retry.push(trace.text());
    trace.lines().forEach((line: string): void => {
      retry.push(line);
    });
    retry.push(auditRetryRules().summary());
    this.retryLinesState = retry;
  }

  private canOpenBusiness(): boolean {
    const controller = getLearningController();
    return controller !== undefined && controller.snapshot().canEdit;
  }

  private openBusiness(kind: string, page: string): void {
    this.navigationMessage = '';
    const controller = getLearningController();
    if (controller === undefined) { this.navigationMessage = localize('ac_scenariopage_011'); return; }
    try {
      if (!controller.openScene(kind)) {
        const error = controller.sceneWorkbench.snapshot().error;
        this.navigationMessage = controller.snapshot().canEdit && error.length > 0 ? error : localize('ac_scenariopage_012');
        return;
      }
      router.pushUrl({ url: page }).catch((error: BusinessError): void => {
        this.navigationMessage = localize('ac_index_009', [learningError(error)]);
      });
    } catch (error) { this.navigationMessage = localize('ac_index_009', [learningError(error as BusinessError)]); }
  }

  @Builder
  private card(title: string, lines: string[]) {
    LearningDisclosure({ title: title }) {
      Column({ space: 10 }) {
        ForEach(lines, (line: string) => {
          Text(line).fontSize(14).lineHeight(22).fontColor('#667085').width('100%')
        }, (line: string) => line)
      }.width('100%')
    }
  }

  build() {
    Scroll() {
      Column({ space: 14 }) {
        Button($r('app.string.ac_scenariopage_015'), { type: ButtonType.Normal })
          .height(44).fontSize(14)
          .fontColor('#2563EB')
          .backgroundColor('#EEF4FF')
          .borderRadius(10)
          .padding({ left: 14, right: 14, top: 10, bottom: 10 })
          .onClick(() => router.back())

        Text($r('app.string.ac_index_095'))
          .fontSize(26)
          .fontWeight(FontWeight.Bold)
          .fontColor('#182238')
          .width('100%')
        Text(this.headline)
          .fontSize(14)
          .fontColor('#667085')
          .width('100%')

        Row({ space: 10 }) {
          Button($r('app.string.ac_scenariopage_017'), { type: ButtonType.Normal })
            .layoutWeight(1)
            .height(44)
            .fontSize(14)
            .fontColor('#FFFFFF')
            .backgroundColor('#2563EB')
            .borderRadius(10)
            .enabled(this.canOpenBusiness()).onClick(() => { this.openBusiness('note', 'pages/NoteScenePage'); })
          Button($r('app.string.ac_scenariopage_018'), { type: ButtonType.Normal })
            .layoutWeight(1)
            .height(44)
            .fontSize(14)
            .fontColor('#2563EB')
            .backgroundColor('#EEF4FF')
            .borderRadius(10)
            .enabled(this.canOpenBusiness()).onClick(() => { this.openBusiness('reading', 'pages/ReadingScenePage'); })
        }
        .width('100%')

        Button($r('app.string.ac_scenariopage_019'), { type: ButtonType.Normal })
          .width('100%')
          .height(44)
          .fontSize(14)
          .fontColor('#2563EB')
          .backgroundColor('#EEF4FF')
          .borderRadius(10)
          .enabled(this.canOpenBusiness()).onClick(() => { this.openBusiness('form', 'pages/FormScenePage'); })

        if (this.navigationMessage.length > 0) {
          Text(this.navigationMessage).fontSize(14).fontColor('#B42318').width('100%')
        }
        this.card(localize('ac_scenariopage_020'), this.scenarioLinesState)
        this.card(localize('ac_scenariopage_021'), this.stepLinesState)
        this.card(localize('ac_scenariopage_022'), this.validatorLinesState)
        this.card(localize('ac_scenariopage_023'), this.sampleLinesState)
        this.card(localize('ac_scenariopage_024'), this.dictionaryLinesState)
        this.card(localize('ac_scenariopage_025'), this.retryLinesState)
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 16, bottom: 28 })
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F7FA')
    .scrollBar(BarState.Auto).align(Alignment.TopStart)
  }
}
