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

import { formatResource, localText } from '../autostart/text/LocalizedText';

import { pasteboard } from '@kit.BasicServicesKit';
import { promptAction, router } from '@kit.ArkUI';
import { autoStartupService } from '../autostart/AutoStartupService';
import { QueryRecord } from '../autostart/AutoStartupTypes';
import {
  ArchiveRecord, ArchivePlan, CompactionReport, auditRetention, buildCompaction, retentionLines,
  tierLines
} from '../autostart/history/ArchivePolicy';
import {
  CheckLayer, FAULT_CATALOG, FaultOwner, auditFaults, criticalFaults, faultIds, faultLines,
  faultsOfLayer, faultsOfOwner, layerLabel, ownerLabel, planActions, summarizeFaults
} from '../autostart/diagnostics/FaultCatalog';
import {
  CHAIN_RULES, Conclusion, auditChains, bestChain, chainLines, evidenceIds, evidenceLines,
  feasibleCounts, kindLines
} from '../autostart/diagnostics/EvidenceChain';
import {
  ONBOARDING_STEPS, OnboardingFlow, auditOnboarding, groupProgressLines, mandatorySteps,
  skippableSteps, stepLines, totalSeconds
} from '../autostart/guide/OnboardingFlow';

@Entry
@Component
struct FaultPage {
  @State private faultLinesState: string[] = [];
  @State private actionLines: string[] = [];
  @State private archiveLines: string[] = [];
  @State private evidenceLinesState: string[] = [];
  @State private onboardingLines: string[] = [];
  @State private headline: string = '';
  @State private notice: string = '';
  @State private expandedSection: string = '';

  aboutToAppear(): void {
    this.rebuild();
  }

  onPageShow(): void {
    this.rebuild();
  }

  private records(): QueryRecord[] {
    return autoStartupService.records('all');
  }

  private archiveRecords(): ArchiveRecord[] {
    const list: ArchiveRecord[] = [];
    this.records().forEach((record: QueryRecord): void => {
      list.push(new ArchiveRecord(record.id, record.timestamp, record.outcome as string));
    });
    return list;
  }

  private rebuild(): void {
    const summary = summarizeFaults();
    this.headline = `${summary.text()}｜${auditFaults().summary()}`;
    const lines: string[] = faultLines();
    const owners: FaultOwner[] = [FaultOwner.SYSTEM, FaultOwner.APP, FaultOwner.USER,
      FaultOwner.ENVIRONMENT];
    const ownerParts: string[] = owners.map((owner: FaultOwner): string =>
      `${ownerLabel(owner)} ${faultsOfOwner(owner).length}`);
    lines.push(formatResource('startup_format_08ea3219d621', [String(ownerParts.join(' / '))]));
    const layers: CheckLayer[] = [CheckLayer.CAPABILITY, CheckLayer.PERMISSION,
      CheckLayer.QUERY, CheckLayer.STORAGE, CheckLayer.UI];
    const layerParts: string[] = layers.map((layer: CheckLayer): string =>
      `${layerLabel(layer)} ${faultsOfLayer(layer).length}`);
    lines.push(formatResource('startup_format_e69a71fbd7c2', [String(layerParts.join(' / '))]));
    this.faultLinesState = lines;

    const actions: string[] = [];
    planActions(faultIds()).forEach((action): void => {
      actions.push(action.text());
    });
    actions.push(formatResource('startup_format_dc531a6cf5e6', [String(criticalFaults().length)]));
    this.actionLines = actions;

    const report: CompactionReport = buildCompaction(this.archiveRecords(), Date.now());
    const plan: ArchivePlan = report.plan;
    const archive: string[] = [plan.text()];
    tierLines().forEach((line: string): void => {
      archive.push(line);
    });
    retentionLines().forEach((line: string): void => {
      archive.push(line);
    });
    archive.push(auditRetention().summary());
    report.decisions.forEach((line: string): void => {
      archive.push(line);
    });
    this.archiveLines = archive;

    const evidence: string[] = evidenceLines();
    kindLines().forEach((line: string): void => {
      evidence.push(line);
    });
    chainLines().forEach((line: string): void => {
      evidence.push(line);
    });
    evidence.push(formatResource('startup_format_23a6d544d29a', [String(feasibleCounts(evidenceIds()).join(' /'))]));
    const supported = bestChain(Conclusion.SUPPORTED, ['EV-01', 'EV-10', 'EV-11', 'EV-07']);
    evidence.push(formatResource('startup_format_8b98ce0363db', [String(supported === undefined ? localText('startup_text_0524') : supported.text())]));
    const failed = bestChain(Conclusion.FAILED, ['EV-06', 'EV-08']);
    evidence.push(formatResource('startup_format_aef3ff20682d', [String(failed === undefined ? localText('startup_text_0524') : failed.text())]));
    evidence.push(auditChains().summary());
    evidence.push(formatResource('startup_format_0e00c374dbc8', [String(evidenceIds().length), String(CHAIN_RULES.length)]));
    this.evidenceLinesState = evidence;

    const flow: OnboardingFlow = new OnboardingFlow();
    flow.complete('OB-01');
    flow.complete('OB-02');
    flow.skip('OB-19');
    const onboarding: string[] = [flow.text()];
    onboarding.push(formatResource('startup_format_336f0852ca33', [String(mandatorySteps().length), String(skippableSteps().length)]) +
      formatResource('startup_format_0b70d84ddd7a', [String(totalSeconds())]));
    groupProgressLines(flow).forEach((line: string): void => {
      onboarding.push(line);
    });
    stepLines().forEach((line: string): void => {
      onboarding.push(line);
    });
    onboarding.push(formatResource('startup_format_6457ea597395', [String(flow.current() === undefined ? localText('startup_text_0524') : flow.current()?.stepId)]));
    onboarding.push(formatResource('startup_format_b331ac27728f', [String(flow.blocked().length)]));
    onboarding.push(auditOnboarding().summary());
    this.onboardingLines = onboarding;
  }

  private copyAll(): void {
    const content: string = `${this.headline}\n\n${this.faultLinesState.join('\n')}\n\n` +
      `${this.actionLines.join('\n')}\n\n${this.archiveLines.join('\n')}\n\n` +
      `${this.evidenceLinesState.join('\n')}\n\n${this.onboardingLines.join('\n')}`;
    try {
      const data = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, content);
      pasteboard.getSystemPasteboard().setData(data).then(() => {
        this.notice = formatResource('startup_format_32e57d9ce315', [String(content.length)]);
        promptAction.showToast({ message: this.notice });
      }).catch(() => {
        this.notice = localText('startup_text_0154');
        promptAction.showToast({ message: this.notice });
      });
    } catch (_) {
      this.notice = localText('startup_text_0154');
    }
  }

  @Builder
  private card(title: string, lines: string[]) {
    Column({ space: 12 }) {
      Button({ type: ButtonType.Normal }) {
        Row({ space: 12 }) {
          Text(title).fontSize(16).fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.text_primary')).layoutWeight(1)
          Text(this.expandedSection === title ? '−' : '+').fontSize(16).fontColor($r('app.color.text_secondary'))
        }.width('100%')
      }.width('100%').height(44).padding(0).backgroundColor(Color.Transparent)
        .onClick(() => { this.expandedSection = this.expandedSection === title ? '' : title; })
      if (this.expandedSection === title) {
        if (title === localText('startup_text_0879')) {
          Text(this.headline).fontSize(12).fontColor($r('app.color.text_secondary')).width('100%')
        }
        ForEach(lines, (line: string) => {
          Text(line).fontSize(14).fontColor($r('app.color.text_secondary')).width('100%')
        }, (line: string) => line)
      }
    }.width('100%').padding(16).alignItems(HorizontalAlign.Start)
      .backgroundColor($r('app.color.card_background')).borderRadius(16)
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        Button(localText('startup_text_0842'), { type: ButtonType.Normal })
          .fontSize(17)
          .fontColor($r('app.color.accent_color'))
          .backgroundColor($r('app.color.accent_soft'))
          .borderRadius(12)
          .padding({ left: 16, right: 16, top: 12, bottom: 12 })
          .onClick(() => router.back())

        Column({ space: 8 }) {
          Text(localText('startup_text_0880'))
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.text_primary'))
            .width('100%')
          Text(localText('startup_text_0881'))
            .fontSize(14)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
          Text(formatResource('startup_format_23553164b8f3', [String(FAULT_CATALOG.length), String(this.records().length)]))
            .fontSize(14)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)

        this.card(localText('startup_text_0879'), this.faultLinesState)
        this.card(localText('startup_text_0884'), this.actionLines)
        this.card(localText('startup_text_0885'), this.archiveLines)
        this.card(localText('startup_text_0886'), this.evidenceLinesState)
        this.card(localText('startup_text_0887'), this.onboardingLines)

        Button({ type: ButtonType.Normal }) {
          Text(localText('startup_text_0888'))
            .fontSize(16)
            .fontColor(Color.White)
            .width('100%')
            .textAlign(TextAlign.Center)
        }
        .width('100%')
        .constraintSize({ minHeight: 48 })
        .padding({ left: 20, right: 20, top: 14, bottom: 14 })
        .backgroundColor($r('app.color.accent_color'))
        .borderRadius(16)
        .onClick(() => this.copyAll())

        Text(this.notice)
          .fontSize(14)
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 20, bottom: 28 })
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
    .scrollBar(BarState.Auto)
  }
}
