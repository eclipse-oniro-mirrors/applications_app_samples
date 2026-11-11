import { router } from '@kit.ArkUI';
import { AppService, getAppService } from '../core/AppService';
import { flowMetricSamples, evaluateFlowThresholds, evaluateFlowGate, flowThresholds,
  flowGateRules } from '../core/FlowMetrics';
import {
  AppState, CallRecord, LaunchSample, MaintenanceFlow, MaintenanceStep, emptyCallRecord, formatTime
} from '../core/Types';
import { InfoField, ChoiceButton, ActionButton, MemoryResultCard, CallRecordCard } from '../components/ReactiveCards';
import {
  PlanRun, StepOutcome, evaluateRun
} from '../core/MaintenancePlan';
import {
  Workload, auditProfile, planBatches, profileLines, profileOf, tierLabel
} from '../core/LoadProfile';
import {
  BudgetReport, CONTENT_LOAD_GROUPS, GroupStats, allStats, auditBudgets, budgetLines, evaluateBudgets
} from '../core/LaunchBudget';
import {
  MetricSample, auditThresholds, entriesOfLevel, evaluateThresholds, levelLines, samplesOfRun,
  thresholdLines, ThresholdLevel
} from '../core/ThresholdCatalog';
import {
  auditGate, evaluateGate, gateMetrics, GateVerdict, levelLines as gateLevelLines, ruleLines as gateRuleLines,
  verdictLabel as gateVerdictLabel
} from '../core/RegressionGate';

@Entry
@Component
struct Index {
  @State deviceText: string = '';
  @State foreground: boolean = true;
  @State files: string[] = [];
  @State modules: string[] = [];
  @State targetMessage: string = '';
  @State configText: string = '';
  @State configStatus: string = '';
  @State configTargets: string[] = [];
  @State maintenance: MaintenanceFlow | undefined = undefined;
  @State maintenanceBusy: boolean = false;
  @State maintenanceMode: number = 0;
  @State memoryBusy: boolean = false;
  @State resourceBusy: boolean = false;
  @State resourceText: string = '待读取';
  @State latestMemory: CallRecord | undefined = undefined;
  @State snapFlag: string = '尚未设置';
  @State snapAt: number = 0;
  @State rebuildAt: number = 0;
  @State rebuildWaitSeconds: number = 0;
  @State logs: CallRecord[] = [];
  @State launches: LaunchSample[] = [];
  @State storageMessage: string = '';
  @State notice: string = '';
  @State selectedTab: number = 0;
  @State memoryMode: number = 0;
  @State selectedFiles: string[] = [];
  @State selectedModules: string[] = [];
  @State extraFiles: string = '';
  @State configOpen: boolean = false;
  @State reasonText: string = '手动重建';
  @State recordPane: number = 0;
  @State logFilter: number = 0;
  @State expandedRecordId: number = -1;
  @State advancedToolsOpen: boolean = false;
  @State metricDetailsOpen: boolean = false;
  @State planDetailsOpen: boolean = false;
  @State ruleDetailsOpen: boolean = false;

  private service: AppService | undefined = undefined;
  private observerId: number = -1;

  private applySnapshot(snapshot: AppState): void {
    this.deviceText = snapshot.deviceText;
    this.foreground = snapshot.foreground;
    this.files = snapshot.files;
    this.modules = snapshot.modules;
    this.targetMessage = snapshot.targetMessage;
    this.configText = snapshot.configText;
    this.configStatus = snapshot.configStatus;
    this.configTargets = snapshot.configTargets;
    this.maintenance = snapshot.maintenance;
    this.maintenanceBusy = snapshot.maintenanceBusy;
    this.memoryBusy = snapshot.memoryBusy;
    this.resourceBusy = snapshot.resourceBusy;
    this.resourceText = snapshot.resourceText;
    this.latestMemory = snapshot.latestMemory;
    this.snapFlag = snapshot.snapFlag;
    this.snapAt = snapshot.snapAt;
    this.rebuildAt = snapshot.rebuildAt;
    this.rebuildWaitSeconds = snapshot.rebuildWaitSeconds;
    this.logs = snapshot.logs;
    this.launches = snapshot.launches;
    this.storageMessage = snapshot.storageMessage;
    this.notice = snapshot.notice;
  }

  aboutToAppear(): void {
    const service: AppService = getAppService();
    this.service = service;
    this.applySnapshot(service.getState());
    this.observerId = service.subscribe((): void => {
      this.applySnapshot(service.getState());
    });
    service.refreshTargets();
    service.checkConfig();
  }

  aboutToDisappear(): void {
    const service: AppService | undefined = this.service;
    if (service !== undefined && this.observerId >= 0) {
      service.unsubscribe(this.observerId);
    }
    this.observerId = -1;
    this.service = undefined;
  }

  private selectFile(file: string, checked: boolean): void {
    if (checked) {
      if (this.selectedFiles.indexOf(file) < 0) {
        this.selectedFiles = this.selectedFiles.concat(file);
      }
    } else {
      this.selectedFiles = this.selectedFiles.filter((value: string): boolean => value !== file);
    }
  }

  private selectModule(module: string, checked: boolean): void {
    if (checked) {
      if (this.selectedModules.indexOf(module) < 0) {
        this.selectedModules = this.selectedModules.concat(module);
      }
    } else {
      this.selectedModules = this.selectedModules.filter((value: string): boolean => value !== module);
    }
  }

  private manualFiles(): string[] {
    return this.extraFiles.split(/[,，]/)
      .filter((value: string): boolean => value.trim().length > 0);
  }

  private memoryDisabled(): boolean {
    if (this.memoryBusy) {
      return true;
    }
    if (this.memoryMode === 0) {
      return this.selectedFiles.length === 0 && this.manualFiles().length === 0;
    }
    return this.selectedModules.length === 0;
  }

  private refreshTargets(): void {
    const service: AppService | undefined = this.service;
    if (service !== undefined) {
      service.refreshTargets();
    }
  }

  private checkConfig(): void {
    const service: AppService | undefined = this.service;
    if (service !== undefined) {
      service.checkConfig();
    }
  }

  private evictMemory(): void {
    const service: AppService | undefined = this.service;
    if (service === undefined) {
      return;
    }
    if (this.memoryMode === 0) {
      service.evictFiles(this.selectedFiles.concat(this.manualFiles()));
    } else {
      service.evictModules(this.selectedModules);
    }
  }

  private readResource(verify: boolean): void {
    const service: AppService | undefined = this.service;
    if (service !== undefined) {
      if (verify) {
        service.verifyResource();
      } else {
        service.readResource();
      }
    }
  }

  private runMaintenance(): void {
    const service: AppService | undefined = this.service;
    if (service !== undefined) {
      const mode: string = this.maintenanceMode === 1 ? 'control' :
        (this.maintenanceMode === 2 ? 'modules' : 'files');
      service.runMaintenanceFlow(mode);
    }
  }

  private setSnapEnabled(enabled: boolean): void {
    const service: AppService | undefined = this.service;
    if (service !== undefined) {
      service.setSnapEnabled(enabled);
    }
  }

  private confirmRebuild(): void {
    AlertDialog.show({
      title: '请求重建',
      message: '重建应用快启数据？',
      primaryButton: {
        value: '取消',
        action: (): void => {}
      },
      secondaryButton: {
        value: '确认重建',
        action: (): void => {
          const service: AppService | undefined = this.service;
          if (service !== undefined) {
            service.rebuildSnap(this.reasonText.trim() || '手动重建');
          }
        }
      }
    });
  }

  private currentLog(id: number): CallRecord {
    const record = this.logs.find((entry: CallRecord): boolean => entry.id === id);
    return record === undefined ? emptyCallRecord() : record;
  }

  private filteredLogs(): CallRecord[] {
    if (this.logFilter === 0) {
      return this.logs;
    }
    return this.logs.filter((record: CallRecord): boolean => {
      if (this.logFilter === 1) {
        return record.api === 'evictFilePages' || record.api === 'evictModuleFilePages';
      }
      return record.api === 'setHyperSnapEnabled' || record.api === 'requestRebuildHyperSnap';
    });
  }

  private copyLogs(): void {
    const service: AppService | undefined = this.service;
    if (service !== undefined) {
      service.copyText(JSON.stringify(this.filteredLogs(), null, 2));
    }
  }

  private confirmClearLogs(): void {
    AlertDialog.show({
      title: '清空记录',
      message: '清空全部调用记录？',
      primaryButton: {
        value: '取消',
        action: (): void => {}
      },
      secondaryButton: {
        value: '清空',
        action: (): void => {
          const service: AppService | undefined = this.service;
          if (service !== undefined) {
            service.clearLogs();
            this.expandedRecordId = -1;
          }
        }
      }
    });
  }

  private sampleCount(group: string): number {
    return this.launches.filter((sample: LaunchSample): boolean => sample.group === group).length;
  }

  private sampleMedian(group: string): string {
    const values: number[] = this.launches
      .filter((sample: LaunchSample): boolean => sample.group === group)
      .map((sample: LaunchSample): number => sample.contentMs);
    if (values.length === 0) {
      return '—';
    }
    values.sort((left: number, right: number): number => left - right);
    const middle: number = Math.floor(values.length / 2);
    const median: number = values.length % 2 === 0 ?
      (values[middle - 1] + values[middle]) / 2 : values[middle];
    return `${median.toFixed(1)} ms`;
  }

  private copyLaunches(): void {
    const service: AppService | undefined = this.service;
    if (service !== undefined) {
      service.copyText(JSON.stringify(this.launches, null, 2));
    }
  }

  private confirmClearLaunches(): void {
    AlertDialog.show({
      title: '清空采样',
      message: '清空全部内容加载样本？',
      primaryButton: {
        value: '取消',
        action: (): void => {}
      },
      secondaryButton: {
        value: '清空',
        action: (): void => {
          const service: AppService | undefined = this.service;
          if (service !== undefined) {
            service.clearLaunches();
          }
        }
      }
    });
  }

  @Builder
  heading(title: string, subtitle: string): void {
    Column({ space: 6 }) {
      Text(title)
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor('#182238')
      Text(subtitle)
        .fontSize(14)
        .fontColor('#667085')
    }
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .margin({ top: 8, bottom: 4 })
  }

  @Builder
  memoryPage(): void {
    this.heading('内存优化', '选择目标，请求回收文件页')
    Row({ space: 10 }) {
      Text(this.deviceText)
        .layoutWeight(1)
        .fontSize(12)
        .fontColor('#667085')
      Text(this.foreground ? '前台' : '后台')
        .fontSize(12)
        .fontColor('#526582')
        .padding({ left: 9, right: 9, top: 4, bottom: 4 })
        .backgroundColor('#E9EEF6')
        .borderRadius(8)
    }
    .width('100%')

    Column({ space: 14 }) {
      Row({ space: 4 }) {
        ChoiceButton({ label: '文件', selected: this.memoryMode === 0, onSelect: (): void => { this.memoryMode = 0; } })
        ChoiceButton({ label: '模块', selected: this.memoryMode === 1, onSelect: (): void => { this.memoryMode = 1; } })
      }
      .padding(4)
      .borderRadius(14)
      .backgroundColor('#EEF2F6')
      .width('100%')

      if (this.memoryMode === 0) {
        Column({ space: 8 }) {
          ForEach(this.files, (file: string): void => {
            Row({ space: 8 }) {
              Checkbox({ name: file, group: 'files' })
                .width(24)
                .height(24).responseRegion({ x: -10, y: -10, width: 44, height: 44 })
                .margin(0)
                .selectedColor('#246BFD')
                .select(this.selectedFiles.indexOf(file) >= 0)
                .enabled(!this.memoryBusy)
                .onChange((checked: boolean): void => { this.selectFile(file, checked); })
              Text(file)
                .layoutWeight(1)
                .fontSize(14)
                .fontColor('#182238')
            }
            .width('100%')
            .padding({ top: 5, bottom: 5 }).constraintSize({ minHeight: 44 })
          }, (file: string): string => file)
        }
        .width('100%')
        .alignItems(HorizontalAlign.Start)

        TextInput({ text: this.extraFiles, placeholder: '其他文件名（可选，逗号分隔）' })
          .fontSize(14)
          .height(44)
          .borderRadius(12)
          .backgroundColor('#F5F7FA')
          .onChange((value: string): void => { this.extraFiles = value; })
        if (this.selectedFiles.length === 0 && this.manualFiles().length === 0) {
          Text('选择文件，或输入其他文件名')
            .fontSize(12)
            .fontColor('#667085')
        }
      } else {
        if (this.modules.length === 0) {
          Text('暂无模块')
            .fontSize(14)
            .fontColor('#667085')
            .padding({ top: 10, bottom: 10 })
        } else {
          Column({ space: 8 }) {
            ForEach(this.modules, (module: string): void => {
              Row({ space: 8 }) {
                Checkbox({ name: module, group: 'modules' })
                  .width(24)
                  .height(24).responseRegion({ x: -10, y: -10, width: 44, height: 44 })
                  .margin(0)
                  .selectedColor('#246BFD')
                  .select(this.selectedModules.indexOf(module) >= 0)
                  .enabled(!this.memoryBusy)
                  .onChange((checked: boolean): void => { this.selectModule(module, checked); })
                Text(module)
                  .layoutWeight(1)
                  .fontSize(14)
                  .fontColor('#182238')
              }
              .width('100%')
              .padding({ top: 5, bottom: 5 }).constraintSize({ minHeight: 44 })
            }, (module: string): string => module)
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
        }
      }

      if (this.targetMessage.length > 0) {
        Text(this.targetMessage)
          .fontSize(12)
          .fontColor('#667085')
      }
      Row({ space: 10 }) {
        ActionButton({
          label: '刷新目标',
          primary: false,
          isEnabled: !this.memoryBusy,
          onAction: (): void => { this.refreshTargets(); }
        })
        ActionButton({
          label: this.memoryBusy ? '调用中' : (this.memoryMode === 0 ? '回收文件页' : '回收模块页'),
          primary: true,
          isEnabled: !this.memoryDisabled(),
          onAction: (): void => { this.evictMemory(); }
        })
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor('#FFFFFF')
    .borderRadius(16)

    MemoryResultCard({
      record: this.latestMemory,
      onViewRecords: (): void => {
        this.selectedTab = 2;
        this.recordPane = 0;
        this.logFilter = 1;
      }
    })
    Row() {
      ActionButton({
        label: '业务负载实验台',
        primary: false,
        isEnabled: true,
        onAction: (): void => {
          router.pushUrl({ url: 'pages/WorkloadLabPage' }).catch((): void => {});
        }
      })
    }.width('100%')
    Button(this.advancedToolsOpen ? '收起更多工具' : '更多工具').id('apAdvancedToolsToggle')
      .type(ButtonType.Normal).width('100%').height(44).fontSize(14)
      .fontColor('#667085').backgroundColor('#FFFFFF').borderRadius(12)
      .onClick((): void => { this.advancedToolsOpen = !this.advancedToolsOpen; })
    if (this.advancedToolsOpen) {
      this.configCard()
      this.maintenanceCard()
      this.resourceCard()
    }
  }

  @Builder
  configCard(): void {
    Column({ space: 12 }) {
      Row() {
        Text('配置')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#182238')
          .layoutWeight(1)
        Button(this.configOpen ? '收起' : '展开')
          .type(ButtonType.Normal)
          .fontSize(12)
          .fontColor('#667085')
          .backgroundColor('#EEF2F6')
          .borderRadius(9)
          .height(44)
          .onClick((): void => { this.configOpen = !this.configOpen; })
      }
      .width('100%')
      if (this.configOpen) {
        InfoField({ label: '状态', value: this.configStatus })
        Text(this.configText.length > 0 ? this.configText : '暂无配置')
          .fontSize(12)
          .fontColor('#667085')
          .width('100%')
        Row() {
          ActionButton({
            label: '检查配置',
            primary: false,
            isEnabled: true,
            onAction: (): void => { this.checkConfig(); }
          })
        }
        .width('100%')
      }
    }
    .width('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor('#FFFFFF')
    .borderRadius(16)
  }

  @Builder
  maintenanceCard(): void {
    Column({ space: 12 }) {
      Row() {
        Text('维护流程')
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#182238')
          .layoutWeight(1)
        if (this.maintenance !== undefined) {
          Text(this.maintenance.status)
            .fontSize(12)
            .fontColor('#246BFD')
        } else {
          Text('未运行')
            .fontSize(12)
            .fontColor('#667085')
        }
      }
      .width('100%')
      Text('读取负载、执行请求并校验资源完整性。')
        .fontSize(12)
        .fontColor('#667085')
        .width('100%')
      Row({ space: 8 }) {
        ChoiceButton({ label: '文件回收', selected: this.maintenanceMode === 0,
          onSelect: (): void => { this.maintenanceMode = 0; } })
        ChoiceButton({ label: '无回收对照', selected: this.maintenanceMode === 1,
          onSelect: (): void => { this.maintenanceMode = 1; } })
        ChoiceButton({ label: '模块回收', selected: this.maintenanceMode === 2,
          onSelect: (): void => { this.maintenanceMode = 2; } })
      }
      .width('100%')
      if (this.maintenance !== undefined) {
        ForEach(this.maintenance.steps, (step: MaintenanceStep) => {
          Column({ space: 4 }) {
            Row() {
              Text(step.label).fontSize(14).fontColor('#182238').layoutWeight(1)
              Text(step.status).fontSize(12)
                .fontColor(step.status === '成功' ? '#11845B' : step.status === '失败' ? '#C23F4A' : '#667085')
            }
            .width('100%')
            if (step.detail.length > 0) {
              Text(step.detail).fontSize(12).fontColor('#667085').width('100%')
            }
            if (step.elapsed > 0) {
              Text(`耗时 ${step.elapsed} ms`).fontSize(12).fontColor('#667085').width('100%')
            }
          }
          .width('100%')
          .padding({ top: 6, bottom: 6 })
        }, (step: MaintenanceStep): string => step.key)
        if (this.maintenance.notice.length > 0) {
          Text(this.maintenance.notice).fontSize(12).fontColor('#667085').width('100%')
        }
        Text(`资源完整性：${this.maintenance.integrity}（${this.maintenance.beforeBytes} → ${this.maintenance.afterBytes} 字节）`)
          .fontSize(12).fontColor('#667085').width('100%')
      }
      ActionButton({
        label: this.maintenanceBusy ? '流程运行中' : '运行维护流程',
        primary: true,
        isEnabled: !this.maintenanceBusy && !this.memoryBusy,
        onAction: (): void => { this.runMaintenance(); }
      })
    }
    .width('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor('#FFFFFF')
    .borderRadius(16)
  }

  @Builder
  resourceCard(): void {
    Column({ space: 12 }) {
      Text('资源校验')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor('#182238')
      Text(this.resourceText)
        .fontSize(12)
        .fontColor('#667085')
        .width('100%')
      Row({ space: 10 }) {
        ActionButton({
          label: '读取资源',
          primary: false,
          isEnabled: !this.resourceBusy,
          onAction: (): void => { this.readResource(false); }
        })
        ActionButton({
          label: '读取并校验',
          primary: true,
          isEnabled: !this.resourceBusy,
          onAction: (): void => { this.readResource(true); }
        })
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor('#FFFFFF')
    .borderRadius(16)
  }

  @Builder
  launchPage(): void {
    this.heading('应用快启', '管理快启设置与重建')
    Column({ space: 12 }) {
      Text('快启设置')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor('#182238')
      InfoField({ label: '最近设置', value: this.snapFlag })
      InfoField({ label: '设置时间', value: formatTime(this.snapAt) })
      Row({ space: 10 }) {
        ActionButton({
          label: '启用',
          primary: true,
          isEnabled: true,
          onAction: (): void => { this.setSnapEnabled(true); }
        })
        ActionButton({
          label: '禁用',
          primary: false,
          isEnabled: true,
          onAction: (): void => { this.setSnapEnabled(false); }
        })
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor('#FFFFFF')
    .borderRadius(16)

    Column({ space: 12 }) {
      Text('快启重建')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor('#182238')
      TextInput({ text: this.reasonText, placeholder: '重建原因' })
        .fontSize(14)
        .height(44)
        .maxLength(80)
        .borderRadius(12)
        .backgroundColor('#F5F7FA')
        .onChange((value: string): void => { this.reasonText = value; })
      InfoField({ label: '最近时间', value: formatTime(this.rebuildAt) })
      InfoField({ label: '冷却', value: `${this.rebuildWaitSeconds} 秒` })
      Row() {
        ActionButton({
          label: '请求重建',
          primary: true,
          isEnabled: this.rebuildWaitSeconds <= 0,
          onAction: (): void => { this.confirmRebuild(); }
        })
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor('#FFFFFF')
    .borderRadius(16)
  }

  @Builder
  recordsPage(): void {
    this.heading('调用记录', '查看请求结果与内容加载耗时')
    Row({ space: 4 }) {
      ChoiceButton({ label: '调用记录', selected: this.recordPane === 0, onSelect: (): void => { this.recordPane = 0; } })
      ChoiceButton({ label: '内容加载', selected: this.recordPane === 1, onSelect: (): void => { this.recordPane = 1; } })
    }
    .width('100%')
    .padding(4)
    .backgroundColor('#EEF2F6')
    .borderRadius(14)
    if (this.recordPane === 0) {
      this.logsPane()
    } else {
      this.samplesPane()
    }
  }

  @Builder
  logsPane(): void {
    Column({ space: 12 }) {
      Row({ space: 4 }) {
        ChoiceButton({ label: '全部', selected: this.logFilter === 0, onSelect: (): void => { this.logFilter = 0; } })
        ChoiceButton({ label: '内存', selected: this.logFilter === 1, onSelect: (): void => { this.logFilter = 1; } })
        ChoiceButton({ label: '快启', selected: this.logFilter === 2, onSelect: (): void => { this.logFilter = 2; } })
      }
      .width('100%')
      .padding(4)
      .backgroundColor('#EEF2F6')
      .borderRadius(14)
      Text(`共 ${this.filteredLogs().length} 条`)
        .fontSize(12)
        .fontColor('#667085')
      Row({ space: 10 }) {
        ActionButton({
          label: '复制记录',
          primary: false,
          isEnabled: this.filteredLogs().length > 0,
          onAction: (): void => { this.copyLogs(); }
        })
        ActionButton({
          label: '清空记录',
          primary: false,
          isEnabled: this.logs.length > 0,
          onAction: (): void => { this.confirmClearLogs(); }
        })
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor('#FFFFFF')
    .borderRadius(16)

    if (this.filteredLogs().length === 0) {
      Text('暂无调用记录')
        .fontSize(14)
        .fontColor('#667085')
        .width('100%')
        .textAlign(TextAlign.Center)
        .padding(28)
        .backgroundColor('#FFFFFF')
        .borderRadius(16)
    } else {
      ForEach(this.filteredLogs().map((record: CallRecord): number => record.id), (id: number): void => {
        CallRecordCard({
          record: this.currentLog(id),
          expanded: this.expandedRecordId === id,
          onToggle: (recordId: number): void => {
            this.expandedRecordId = this.expandedRecordId === recordId ? -1 : recordId;
          }
        })
      }, (id: number): string => id.toString())
    }
  }

  @Builder
  sampleSummary(group: string, label: string): void {
    Row({ space: 10 }) {
      Text(label)
        .width(40)
        .fontSize(14)
        .fontColor('#182238')
      Text(`${this.sampleCount(group)} 个样本`)
        .layoutWeight(1)
        .fontSize(12)
        .fontColor('#667085')
      Text(this.sampleMedian(group))
        .fontSize(14)
        .fontWeight(FontWeight.Medium)
        .fontColor('#246BFD')
    }
    .width('100%')
  }

  @Builder
  samplesPane(): void {
    Column({ space: 12 }) {
      Text('内容加载耗时 · 中位数')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor('#182238')
      this.sampleSummary('启用', '启用')
      this.sampleSummary('禁用', '禁用')
      this.sampleSummary('初始', '初始')
      Button(this.metricDetailsOpen ? '收起采样说明' : '采样说明').id('apMetricDetailsToggle')
        .type(ButtonType.Normal).height(44).fontSize(14).fontColor('#667085')
        .backgroundColor('#F5F7FA').borderRadius(12).width('100%')
        .onClick((): void => { this.metricDetailsOpen = !this.metricDetailsOpen; })
      if (this.metricDetailsOpen) {
        Text('统计从页面创建到内容加载完成的时间，按最近快启设置分组；不等同于首帧或系统启动路径。')
          .fontSize(14).fontColor('#667085').lineHeight(22).width('100%')
      }
      Row({ space: 10 }) {
        ActionButton({
          label: '复制采样',
          primary: false,
          isEnabled: this.launches.length > 0,
          onAction: (): void => { this.copyLaunches(); }
        })
        ActionButton({
          label: '清空采样',
          primary: false,
          isEnabled: this.launches.length > 0,
          onAction: (): void => { this.confirmClearLaunches(); }
        })
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .alignItems(HorizontalAlign.Start)
    .backgroundColor('#FFFFFF')
    .borderRadius(16)

    if (this.launches.length === 0) {
      Text('暂无内容加载样本')
        .fontSize(14)
        .fontColor('#667085')
        .width('100%')
        .textAlign(TextAlign.Center)
        .padding(28)
        .backgroundColor('#FFFFFF')
        .borderRadius(16)
    } else {
      ForEach(this.launches, (sample: LaunchSample): void => {
        Column({ space: 9 }) {
          InfoField({ label: '时间', value: formatTime(sample.at) })
          InfoField({ label: '分组', value: sample.group })
          InfoField({ label: '内容加载', value: `${sample.contentMs.toFixed(1)} ms` })
        }
        .width('100%')
        .padding(16)
        .alignItems(HorizontalAlign.Start)
        .backgroundColor('#FFFFFF')
        .borderRadius(16)
      }, (sample: LaunchSample): string => sample.id)
    }
  }

  @Builder
  planPage(): void {
    this.heading('维护计划', '当前流程与内容加载预算')
    Column({ space: 14 }) {
      Text(this.maintenance === undefined ? '尚未运行维护流程' : this.maintenance.status)
        .fontSize(18).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
      Text('内容加载预算').fontSize(16).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
      Text(this.contentBudgetHeadline(evaluateBudgets(this.launches, CONTENT_LOAD_GROUPS)))
        .fontSize(14).fontColor('#667085').width('100%')
      Button(this.planDetailsOpen ? '收起计划详情' : '计划详情').id('apPlanDetailsToggle')
        .type(ButtonType.Normal).height(44).width('100%').fontSize(14)
        .fontColor('#246BFD').backgroundColor('#EEF4FF').borderRadius(12)
        .onClick((): void => { this.planDetailsOpen = !this.planDetailsOpen; })
      if (this.planDetailsOpen) {
        Text(this.planHeadline()).fontSize(14).fontColor('#667085').width('100%')
        Text('阶段结果').fontSize(16).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
        ForEach(this.planStepLines(), (line: string) => {
          Text(line).fontSize(14).fontColor('#667085').width('100%')
        }, (line: string) => line)
        Text('负载画像').fontSize(16).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
        ForEach(this.loadProfileLines(), (line: string) => {
          Text(line).fontSize(14).fontColor('#667085').width('100%')
        }, (line: string) => line)
        Text('预算明细').fontSize(16).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
        ForEach(this.launchBudgetLines(), (line: string) => {
          Text(line).fontSize(14).fontColor('#667085').width('100%')
        }, (line: string) => line)
      }
    }.width('100%').padding(16).backgroundColor('#FFFFFF').borderRadius(16)
  }

  private planRun(): PlanRun {
    const results: StepOutcome[] = [];
    const flow: MaintenanceFlow | undefined = this.maintenance;
    if (flow !== undefined) {
      flow.steps.forEach((step: MaintenanceStep): void => {
        const status: string = step.status === '成功' ? '成功' :
          (['失败', '超时', '已取消'].indexOf(step.status) >= 0 ? '失败' : '跳过');
        const outcome: StepOutcome = new StepOutcome(step.key, status);
        outcome.elapsed = step.elapsed;
        outcome.detail = step.detail;
        results.push(outcome);
      });
    }
    return evaluateRun(flow === undefined ? [] : flow.steps.map((step: MaintenanceStep): string => step.key), results);
  }

  private planHeadline(): string {
    return `${this.maintenance === undefined ? '尚未运行维护流程' : this.maintenance.status}｜` +
      `${gateVerdictLabel(evaluateFlowGate(this.maintenance).verdict())}`;
  }

  private planStepLines(): string[] {
    const lines: string[] = ['阶段：发现目标 → 校验配置 → 读取负载 → 对照/请求回收 → 同资源重读 → 配置回读'];
    if (this.maintenance === undefined) { return lines.concat('尚无阶段结果'); }
    this.planRun().outcomes.forEach((item: StepOutcome): void => {
      lines.push(item.text());
    });
    return lines;
  }

  private loadProfileLines(): string[] {
    if (this.maintenance === undefined || this.maintenance.digestBefore.length === 0) {
      return ['尚无负载读取结果'];
    }
    const workload: Workload = new Workload(1, this.maintenance.beforeBytes, this.modules.length);
    const plan = planBatches(workload);
    const lines: string[] = [profileOf(workload).text()];
    lines.push(`${tierLabel(plan.tier)}｜${plan.text()}`);
    profileLines().forEach((line: string): void => {
      lines.push(line);
    });
    lines.push(auditProfile().summary());
    return lines;
  }

  private contentBudgetHeadline(report: BudgetReport): string {
    return report.measured() === 0 ? '暂无采样，待评估' : report.headline();
  }

  private launchBudgetLines(): string[] {
    const report = evaluateBudgets(this.launches, CONTENT_LOAD_GROUPS);
    const lines: string[] = [this.contentBudgetHeadline(report)];
    budgetLines(CONTENT_LOAD_GROUPS).forEach((line: string): void => {
      lines.push(line);
    });
    allStats(this.launches, CONTENT_LOAD_GROUPS).forEach((stats: GroupStats): void => {
      lines.push(stats.text());
    });
    lines.push(auditBudgets(CONTENT_LOAD_GROUPS).summary());
    lines.push(`分组 ${CONTENT_LOAD_GROUPS.length} 个`);
    return lines;
  }

  private checkHeadline(): string {
    const verdict: GateVerdict = evaluateFlowGate(this.maintenance).verdict();
    switch (verdict) {
      case GateVerdict.PASS: return '通过';
      case GateVerdict.WARN: return '有提示';
      case GateVerdict.BLOCK: return '未通过';
      default: return '待评估';
    }
  }

  @Builder
  matrixPage(): void {
    this.heading('检查结果', '按当前维护结果评估')
    Column({ space: 14 }) {
      Text(evaluateFlowThresholds(this.maintenance).headline()).fontSize(18)
        .fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
      Text(this.checkHeadline()).fontSize(14)
        .fontColor('#667085').width('100%')
      Button(this.ruleDetailsOpen ? '收起检查详情' : '检查详情').id('apRulesDetailsToggle')
        .type(ButtonType.Normal).height(44).width('100%').fontSize(14)
        .fontColor('#246BFD').backgroundColor('#EEF4FF').borderRadius(12)
        .onClick((): void => { this.ruleDetailsOpen = !this.ruleDetailsOpen; })
      if (this.ruleDetailsOpen) {
        Text('阈值评估').fontSize(16).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
        Text(this.thresholdHeadline()).fontSize(14).fontColor('#667085').width('100%')
        ForEach(this.thresholdLinesState(), (line: string) => {
          Text(line).fontSize(14).fontColor('#667085').width('100%')
        }, (line: string) => line)
        Text('回归门禁').fontSize(16).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
        Text(this.gateHeadline()).fontSize(14).fontColor('#667085').width('100%')
        ForEach(this.gateLinesState(), (line: string) => {
          Text(line).fontSize(14).fontColor('#667085').width('100%')
        }, (line: string) => line)
      }
    }.width('100%').padding(16).backgroundColor('#FFFFFF').borderRadius(16)
  }

  private thresholdSamplesOfRun(): MetricSample[] {
    return flowMetricSamples(this.maintenance);
  }

  private thresholdHeadline(): string {
    const report = evaluateFlowThresholds(this.maintenance);
    return `${report.headline()}｜${auditThresholds().summary()}｜必达 ${entriesOfLevel(ThresholdLevel.MUST).length} 条`;
  }

  private thresholdLinesState(): string[] {
    const lines: string[] = levelLines();
    flowThresholds().forEach((entry): void => {
      lines.push(entry.text());
    });
    const report = evaluateFlowThresholds(this.maintenance);
    report.results.forEach((item): void => {
      lines.push(item.text());
    });
    return lines;
  }

  private gateHeadline(): string {
    const report = evaluateFlowGate(this.maintenance);
    return `${gateVerdictLabel(report.verdict())}｜阻断 ${report.blockers().length} 项｜` +
      `提示 ${report.warnings().length} 项｜${auditGate().summary()}`;
  }

  private gateLinesState(): string[] {
    const lines: string[] = gateLevelLines();
    flowGateRules().forEach((rule): void => {
      lines.push(rule.text());
    });
    lines.push(`覆盖指标 ${gateMetrics().length} 个`);
    const report = evaluateFlowGate(this.maintenance);
    report.results.forEach((item): void => {
      lines.push(item.text());
    });
    return lines;
  }

  @Builder
  bottomTab(label: string, tab: number): void {
    Button() {
      Text(label)
        .fontSize(14)
        .minFontSize(12)
        .maxFontSize(14)
        .maxLines(1)
        .heightAdaptivePolicy(TextHeightAdaptivePolicy.MIN_FONT_SIZE_FIRST)
        .fontWeight(this.selectedTab === tab ? FontWeight.Medium : FontWeight.Regular)
        .fontColor(this.selectedTab === tab ? '#246BFD' : '#667085')
    }
    .type(ButtonType.Normal)
    .layoutWeight(1)
    .height(52)
    .padding({ left: 4, right: 4 })
    .borderRadius(12)
    .backgroundColor(this.selectedTab === tab ? '#EAF1FF' : '#FFFFFF')
    .onClick((): void => { this.selectedTab = tab; })
  }

  build(): void {
    Column() {
      Scroll() {
        Column({ space: 16 }) {
          if (this.notice.length > 0 && this.notice !== this.storageMessage) {
            Text(this.notice)
              .fontSize(12)
              .fontColor('#365F9E')
              .width('100%')
              .padding(12)
              .backgroundColor('#E8F0FF')
              .borderRadius(12)
          }
          if (this.storageMessage.length > 0) {
            Text(this.storageMessage)
              .fontSize(12)
              .fontColor('#B94B50')
              .width('100%')
              .padding(12)
              .backgroundColor('#FFF0F0')
              .borderRadius(12)
          }
          if (this.selectedTab === 0) {
            this.memoryPage()
          } else if (this.selectedTab === 1) {
            this.launchPage()
          } else if (this.selectedTab === 2) {
            this.recordsPage()
          } else if (this.selectedTab === 3) {
            this.planPage()
          } else {
            this.matrixPage()
          }
        }
        .width('100%')
        .padding({ left: 20, right: 20, top: 16, bottom: 28 })
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .layoutWeight(1)
      .align(Alignment.TopStart)
      .scrollBar(BarState.Off)
      Row({ space: 6 }) {
        this.bottomTab('内存优化', 0)
        this.bottomTab('应用快启', 1)
        this.bottomTab('调用记录', 2)
        this.bottomTab('维护计划', 3)
        this.bottomTab('检查结果', 4)
      }
      .width('100%')
      .padding({ left: 12, right: 12, top: 10, bottom: 10 })
      .backgroundColor('#FFFFFF')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F7FA')
  }
}
