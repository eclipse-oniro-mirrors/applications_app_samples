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
    return autoStartupService.records('全部');
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
    lines.push(`归属分布：${ownerParts.join(' / ')}`);
    const layers: CheckLayer[] = [CheckLayer.CAPABILITY, CheckLayer.PERMISSION,
      CheckLayer.QUERY, CheckLayer.STORAGE, CheckLayer.UI];
    const layerParts: string[] = layers.map((layer: CheckLayer): string =>
      `${layerLabel(layer)} ${faultsOfLayer(layer).length}`);
    lines.push(`层分布：${layerParts.join(' / ')}`);
    this.faultLinesState = lines;

    const actions: string[] = [];
    planActions(faultIds()).forEach((action): void => {
      actions.push(action.text());
    });
    actions.push(`优先项 ${criticalFaults().length} 条`);
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
    evidence.push(`可行链：${feasibleCounts(evidenceIds()).join(' /')}`);
    const supported = bestChain(Conclusion.SUPPORTED, ['EV-01', 'EV-10', 'EV-11', 'EV-07']);
    evidence.push(`支持结论：${supported === undefined ? '无' : supported.text()}`);
    const failed = bestChain(Conclusion.FAILED, ['EV-06', 'EV-08']);
    evidence.push(`失败结论：${failed === undefined ? '无' : failed.text()}`);
    evidence.push(auditChains().summary());
    evidence.push(`证据 ${evidenceIds().length} 条，链规则 ${CHAIN_RULES.length} 条`);
    this.evidenceLinesState = evidence;

    const flow: OnboardingFlow = new OnboardingFlow();
    flow.complete('OB-01');
    flow.complete('OB-02');
    flow.skip('OB-19');
    const onboarding: string[] = [flow.text()];
    onboarding.push(`必做 ${mandatorySteps().length} 步，可跳过 ${skippableSteps().length} 步，` +
      `预计 ${totalSeconds()} 秒`);
    groupProgressLines(flow).forEach((line: string): void => {
      onboarding.push(line);
    });
    stepLines().forEach((line: string): void => {
      onboarding.push(line);
    });
    onboarding.push(`当前步骤：${flow.current() === undefined ? '无' : flow.current()?.stepId}`);
    onboarding.push(`阻塞步骤 ${flow.blocked().length} 个`);
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
        this.notice = `已复制 ${content.length} 字符`;
        promptAction.showToast({ message: this.notice });
      }).catch(() => {
        this.notice = '复制失败，请重试';
        promptAction.showToast({ message: this.notice });
      });
    } catch (_) {
      this.notice = '复制失败，请重试';
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
        if (title === '故障目录') {
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
        Button('‹ 返回', { type: ButtonType.Normal })
          .fontSize(17)
          .fontColor($r('app.color.accent_color'))
          .backgroundColor($r('app.color.accent_soft'))
          .borderRadius(12)
          .padding({ left: 16, right: 16, top: 12, bottom: 12 })
          .onClick(() => router.back())

        Column({ space: 8 }) {
          Text('故障与归档')
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.text_primary'))
            .width('100%')
          Text('按需展开排查参考，不作为本机故障检测结果。')
            .fontSize(14)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
          Text(`目录 ${FAULT_CATALOG.length} 条｜历史 ${this.records().length} 条`)
            .fontSize(14)
            .fontColor($r('app.color.text_secondary'))
            .width('100%')
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)

        this.card('故障目录', this.faultLinesState)
        this.card('处置顺序', this.actionLines)
        this.card('归档与保留', this.archiveLines)
        this.card('结论证据链', this.evidenceLinesState)
        this.card('引导步骤', this.onboardingLines)

        Button({ type: ButtonType.Normal }) {
          Text('复制全部')
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
