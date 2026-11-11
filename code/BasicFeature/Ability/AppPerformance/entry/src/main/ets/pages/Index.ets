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

import { resolveText, displayValue } from '../core/UiText';
import { router } from '@kit.ArkUI';
import { logWarn } from '../core/Logger';
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

  private text(resource: Resource, args: (string | number)[] = []): string {
    return resolveText(this.getUIContext().getHostContext(), resource, args);
  }

  private display(value: string): string {
    return displayValue(this.getUIContext().getHostContext(), value);
  }

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
  @State resourceText: string = '';
  @State latestMemory: CallRecord | undefined = undefined;
  @State snapFlag: string = '';
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
  @State reasonText: string = '';
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
    this.reasonText = this.text($r('app.string.ap_ui_manual_rebuild'));
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
      title: this.text($r('app.string.ap_ui_request_rebuild')),
      message: this.text($r('app.string.ap_ui_rebuild_the_application_s_hypersnap_data')),
      primaryButton: {
        value: this.text($r('app.string.ap_ui_cancel')),
        action: (): void => {}
      },
      secondaryButton: {
        value: this.text($r('app.string.ap_ui_confirm_rebuild')),
        action: (): void => {
          const service: AppService | undefined = this.service;
          if (service !== undefined) {
            service.rebuildSnap(this.reasonText.trim() || this.text($r('app.string.ap_ui_manual_rebuild')));
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
      title: this.text($r('app.string.ap_ui_clear_records')),
      message: this.text($r('app.string.ap_ui_clear_all_call_records')),
      primaryButton: {
        value: this.text($r('app.string.ap_ui_cancel')),
        action: (): void => {}
      },
      secondaryButton: {
        value: this.text($r('app.string.ap_ui_clear')),
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
      title: this.text($r('app.string.ap_ui_clear_samples')),
      message: this.text($r('app.string.ap_ui_clear_all_content_loading_samples')),
      primaryButton: {
        value: this.text($r('app.string.ap_ui_cancel')),
        action: (): void => {}
      },
      secondaryButton: {
        value: this.text($r('app.string.ap_ui_clear')),
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
    this.heading(this.text($r('app.string.ap_ui_memory_optimization')), this.text($r('app.string.ap_ui_select_targets_and_request_file_page_eviction')))
    Row({ space: 10 }) {
      Text(this.deviceText)
        .layoutWeight(1)
        .fontSize(12)
        .fontColor('#667085')
      Text(this.foreground ? this.text($r('app.string.ap_ui_foreground')) : this.text($r('app.string.ap_ui_background')))
        .fontSize(12)
        .fontColor('#526582')
        .padding({ left: 9, right: 9, top: 4, bottom: 4 })
        .backgroundColor('#E9EEF6')
        .borderRadius(8)
    }
    .width('100%')

    Column({ space: 14 }) {
      Row({ space: 4 }) {
        ChoiceButton({ label: this.text($r('app.string.ap_ui_files')), selected: this.memoryMode === 0, onSelect: (): void => { this.memoryMode = 0; } })
        ChoiceButton({ label: this.text($r('app.string.ap_ui_modules')), selected: this.memoryMode === 1, onSelect: (): void => { this.memoryMode = 1; } })
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

        TextInput({ text: this.extraFiles, placeholder: this.text($r('app.string.ap_ui_other_file_names_optional_comma_separated')) })
          .fontSize(14)
          .height(44)
          .borderRadius(12)
          .backgroundColor('#F5F7FA')
          .onChange((value: string): void => { this.extraFiles = value; })
        if (this.selectedFiles.length === 0 && this.manualFiles().length === 0) {
          Text(this.text($r('app.string.ap_ui_select_files_or_enter_other_file_names')))
            .fontSize(12)
            .fontColor('#667085')
        }
      } else {
        if (this.modules.length === 0) {
          Text(this.text($r('app.string.ap_ui_no_modules')))
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
          label: this.text($r('app.string.ap_ui_refresh_targets')),
          primary: false,
          isEnabled: !this.memoryBusy,
          onAction: (): void => { this.refreshTargets(); }
        })
        ActionButton({
          label: this.memoryBusy ? this.text($r('app.string.ap_ui_calling')) : (this.memoryMode === 0 ? this.text($r('app.string.ap_ui_evict_file_pages')) : this.text($r('app.string.ap_ui_evict_module_pages'))),
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
        label: this.text($r('app.string.ap_ui_workload_laboratory')),
        primary: false,
        isEnabled: true,
        onAction: (): void => {
          router.pushUrl({ url: 'pages/WorkloadLabPage' }).catch((error: Error): void => {
            logWarn(`Workload laboratory navigation failed: ${error.message}`);
          });
        }
      })
    }.width('100%')
    Button(this.advancedToolsOpen ? this.text($r('app.string.ap_ui_hide_more_tools')) : this.text($r('app.string.ap_ui_more_tools'))).id('apAdvancedToolsToggle')
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
        Text(this.text($r('app.string.ap_ui_configuration')))
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#182238')
          .layoutWeight(1)
        Button(this.configOpen ? this.text($r('app.string.ap_ui_collapse')) : this.text($r('app.string.ap_ui_expand')))
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
        InfoField({ label: this.text($r('app.string.ap_ui_status')), value: this.configStatus })
        Text(this.configText.length > 0 ? this.configText : this.text($r('app.string.ap_ui_no_configuration')))
          .fontSize(12)
          .fontColor('#667085')
          .width('100%')
        Row() {
          ActionButton({
            label: this.text($r('app.string.ap_ui_check_configuration')),
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
        Text(this.text($r('app.string.ap_ui_maintenance_flow')))
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor('#182238')
          .layoutWeight(1)
        if (this.maintenance !== undefined) {
          Text(this.display(this.maintenance.status))
            .fontSize(12)
            .fontColor('#246BFD')
        } else {
          Text($r('app.string.ap_ui_not_run'))
            .fontSize(12)
            .fontColor('#667085')
        }
      }
      .width('100%')
      Text(this.text($r('app.string.ap_ui_read_the_workload_make_the_request_and_verify_resource_integrity')))
        .fontSize(12)
        .fontColor('#667085')
        .width('100%')
      Row({ space: 8 }) {
        ChoiceButton({ label: this.text($r('app.string.ap_ui_file_eviction')), selected: this.maintenanceMode === 0,
          onSelect: (): void => { this.maintenanceMode = 0; } })
        ChoiceButton({ label: this.text($r('app.string.ap_ui_no_eviction_control')), selected: this.maintenanceMode === 1,
          onSelect: (): void => { this.maintenanceMode = 1; } })
        ChoiceButton({ label: this.text($r('app.string.ap_ui_module_eviction')), selected: this.maintenanceMode === 2,
          onSelect: (): void => { this.maintenanceMode = 2; } })
      }
      .width('100%')
      if (this.maintenance !== undefined) {
        ForEach(this.maintenance.steps, (step: MaintenanceStep) => {
          Column({ space: 4 }) {
            Row() {
              Text(step.label).fontSize(14).fontColor('#182238').layoutWeight(1)
              Text(this.display(step.status)).fontSize(12)
                .fontColor(step.status === '成功' ? '#11845B' : step.status === '失败' ? '#C23F4A' : '#667085')
            }
            .width('100%')
            if (step.detail.length > 0) {
              Text(step.detail).fontSize(12).fontColor('#667085').width('100%')
            }
            if (step.elapsed > 0) {
              Text(this.text($r('app.string.ap_ui_format_061daad6b9'), [step.elapsed])).fontSize(12).fontColor('#667085').width('100%')
            }
          }
          .width('100%')
          .padding({ top: 6, bottom: 6 })
        }, (step: MaintenanceStep): string => step.key)
        if (this.maintenance.notice.length > 0) {
          Text(this.maintenance.notice).fontSize(12).fontColor('#667085').width('100%')
        }
        Text(this.text($r('app.string.ap_ui_format_d3ed71152f'), [this.display(this.maintenance.integrity), this.maintenance.beforeBytes, this.maintenance.afterBytes]))
          .fontSize(12).fontColor('#667085').width('100%')
      }
      ActionButton({
        label: this.maintenanceBusy ? this.text($r('app.string.ap_ui_flow_running')) : this.text($r('app.string.ap_ui_run_maintenance_flow')),
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
      Text(this.text($r('app.string.ap_ui_resource_verification')))
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor('#182238')
      Text(this.display(this.resourceText))
        .fontSize(12)
        .fontColor('#667085')
        .width('100%')
      Row({ space: 10 }) {
        ActionButton({
          label: this.text($r('app.string.ap_ui_read_resource')),
          primary: false,
          isEnabled: !this.resourceBusy,
          onAction: (): void => { this.readResource(false); }
        })
        ActionButton({
          label: this.text($r('app.string.ap_ui_read_and_verify')),
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
    this.heading(this.text($r('app.string.ap_ui_hypersnap')), this.text($r('app.string.ap_ui_manage_hypersnap_settings_and_rebuild_requests')))
    Column({ space: 12 }) {
      Text(this.text($r('app.string.ap_ui_hypersnap_settings')))
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor('#182238')
      InfoField({ label: this.text($r('app.string.ap_ui_latest_setting')), value: this.display(this.snapFlag) })
      InfoField({ label: this.text($r('app.string.ap_ui_setting_time')), value: formatTime(this.snapAt) })
      Row({ space: 10 }) {
        ActionButton({
          label: this.text($r('app.string.ap_ui_enabled')),
          primary: true,
          isEnabled: true,
          onAction: (): void => { this.setSnapEnabled(true); }
        })
        ActionButton({
          label: this.text($r('app.string.ap_ui_disabled')),
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
      Text(this.text($r('app.string.ap_ui_hypersnap_rebuild')))
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor('#182238')
      TextInput({ text: this.reasonText, placeholder: this.text($r('app.string.ap_ui_rebuild_reason')) })
        .fontSize(14)
        .height(44)
        .maxLength(80)
        .borderRadius(12)
        .backgroundColor('#F5F7FA')
        .onChange((value: string): void => { this.reasonText = value; })
      InfoField({ label: this.text($r('app.string.ap_ui_latest_time')), value: formatTime(this.rebuildAt) })
      InfoField({ label: this.text($r('app.string.ap_ui_cooldown')), value: this.text($r('app.string.ap_ui_format_b28ea52b8c'), [this.rebuildWaitSeconds]) })
      Row() {
        ActionButton({
          label: this.text($r('app.string.ap_ui_request_rebuild')),
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
    this.heading(this.text($r('app.string.ap_ui_call_records')), this.text($r('app.string.ap_ui_view_request_results_and_content_loading_durations')))
    Row({ space: 4 }) {
      ChoiceButton({ label: this.text($r('app.string.ap_ui_call_records')), selected: this.recordPane === 0, onSelect: (): void => { this.recordPane = 0; } })
      ChoiceButton({ label: this.text($r('app.string.ap_ui_content_loading')), selected: this.recordPane === 1, onSelect: (): void => { this.recordPane = 1; } })
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
        ChoiceButton({ label: this.text($r('app.string.ap_ui_all')), selected: this.logFilter === 0, onSelect: (): void => { this.logFilter = 0; } })
        ChoiceButton({ label: this.text($r('app.string.ap_ui_memory')), selected: this.logFilter === 1, onSelect: (): void => { this.logFilter = 1; } })
        ChoiceButton({ label: this.text($r('app.string.ap_ui_hypersnap_a50897')), selected: this.logFilter === 2, onSelect: (): void => { this.logFilter = 2; } })
      }
      .width('100%')
      .padding(4)
      .backgroundColor('#EEF2F6')
      .borderRadius(14)
      Text(this.text($r('app.string.ap_ui_format_c71ceedb76'), [this.filteredLogs().length]))
        .fontSize(12)
        .fontColor('#667085')
      Row({ space: 10 }) {
        ActionButton({
          label: this.text($r('app.string.ap_ui_copy_records')),
          primary: false,
          isEnabled: this.filteredLogs().length > 0,
          onAction: (): void => { this.copyLogs(); }
        })
        ActionButton({
          label: this.text($r('app.string.ap_ui_clear_records')),
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
      Text(this.text($r('app.string.ap_ui_no_call_records')))
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
      Text(this.text($r('app.string.ap_ui_format_b4fc476125'), [this.sampleCount(group)]))
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
      Text(this.text($r('app.string.ap_ui_content_loading_duration_median')))
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .fontColor('#182238')
      this.sampleSummary('启用', this.text($r('app.string.ap_ui_enabled')))
      this.sampleSummary('禁用', this.text($r('app.string.ap_ui_disabled')))
      this.sampleSummary('初始', this.text($r('app.string.ap_ui_initial')))
      Button(this.metricDetailsOpen ? this.text($r('app.string.ap_ui_hide_sampling_notes')) : this.text($r('app.string.ap_ui_sampling_notes'))).id('apMetricDetailsToggle')
        .type(ButtonType.Normal).height(44).fontSize(14).fontColor('#667085')
        .backgroundColor('#F5F7FA').borderRadius(12).width('100%')
        .onClick((): void => { this.metricDetailsOpen = !this.metricDetailsOpen; })
      if (this.metricDetailsOpen) {
        Text(this.text($r('app.string.ap_ui_measures_page_creation_to_content_loaded_grouped_by_the_latest_hypersnap')))
          .fontSize(14).fontColor('#667085').lineHeight(22).width('100%')
      }
      Row({ space: 10 }) {
        ActionButton({
          label: this.text($r('app.string.ap_ui_copy_samples')),
          primary: false,
          isEnabled: this.launches.length > 0,
          onAction: (): void => { this.copyLaunches(); }
        })
        ActionButton({
          label: this.text($r('app.string.ap_ui_clear_samples')),
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
      Text(this.text($r('app.string.ap_ui_no_content_loading_samples')))
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
          InfoField({ label: this.text($r('app.string.ap_ui_time')), value: formatTime(sample.at) })
          InfoField({ label: this.text($r('app.string.ap_ui_group')), value: this.display(sample.group) })
          InfoField({ label: this.text($r('app.string.ap_ui_content_loading')), value: `${sample.contentMs.toFixed(1)} ms` })
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
    this.heading(this.text($r('app.string.ap_ui_maintenance_plan')), this.text($r('app.string.ap_ui_current_flow_and_content_loading_budgets')))
    Column({ space: 14 }) {
      Text(this.maintenance === undefined ? this.text($r('app.string.ap_ui_no_maintenance_flow_has_run')) : this.maintenance.status)
        .fontSize(18).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
      Text(this.text($r('app.string.ap_ui_content_loading_budgets'))).fontSize(16).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
      Text(this.contentBudgetHeadline(evaluateBudgets(this.launches, CONTENT_LOAD_GROUPS)))
        .fontSize(14).fontColor('#667085').width('100%')
      Button(this.planDetailsOpen ? this.text($r('app.string.ap_ui_hide_plan_details')) : this.text($r('app.string.ap_ui_plan_details'))).id('apPlanDetailsToggle')
        .type(ButtonType.Normal).height(44).width('100%').fontSize(14)
        .fontColor('#246BFD').backgroundColor('#EEF4FF').borderRadius(12)
        .onClick((): void => { this.planDetailsOpen = !this.planDetailsOpen; })
      if (this.planDetailsOpen) {
        Text(this.planHeadline()).fontSize(14).fontColor('#667085').width('100%')
        Text(this.text($r('app.string.ap_ui_stage_results'))).fontSize(16).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
        ForEach(this.planStepLines(), (line: string) => {
          Text(line).fontSize(14).fontColor('#667085').width('100%')
        }, (line: string) => line)
        Text(this.text($r('app.string.ap_ui_workload_profile'))).fontSize(16).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
        ForEach(this.loadProfileLines(), (line: string) => {
          Text(line).fontSize(14).fontColor('#667085').width('100%')
        }, (line: string) => line)
        Text(this.text($r('app.string.ap_ui_budget_details'))).fontSize(16).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
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
    return `${this.maintenance === undefined ? this.text($r('app.string.ap_ui_no_maintenance_flow_has_run')) : this.maintenance.status}｜` +
      `${gateVerdictLabel(evaluateFlowGate(this.maintenance).verdict())}`;
  }

  private planStepLines(): string[] {
    const lines: string[] = [this.text($r('app.string.ap_ui_stages_discover_targets_validate_configuration_read_workload_control_evi'))];
    if (this.maintenance === undefined) { return lines.concat(this.text($r('app.string.ap_ui_no_stage_results_yet'))); }
    this.planRun().outcomes.forEach((item: StepOutcome): void => {
      lines.push(item.text());
    });
    return lines;
  }

  private loadProfileLines(): string[] {
    if (this.maintenance === undefined || this.maintenance.digestBefore.length === 0) {
      return [this.text($r('app.string.ap_ui_no_workload_read_results_yet'))];
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
    return report.measured() === 0 ? this.text($r('app.string.ap_ui_no_samples_evaluation_pending')) : report.headline();
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
    lines.push(this.text($r('app.string.ap_ui_format_dcbc5df895'), [CONTENT_LOAD_GROUPS.length]));
    return lines;
  }

  private checkHeadline(): string {
    const verdict: GateVerdict = evaluateFlowGate(this.maintenance).verdict();
    switch (verdict) {
      case GateVerdict.PASS: return this.text($r('app.string.ap_ui_pass'));
      case GateVerdict.WARN: return this.text($r('app.string.ap_ui_warnings'));
      case GateVerdict.BLOCK: return this.text($r('app.string.ap_ui_not_passed'));
      default: return this.text($r('app.string.ap_ui_evaluation_pending'));
    }
  }

  @Builder
  matrixPage(): void {
    this.heading(this.text($r('app.string.ap_ui_check_results')), this.text($r('app.string.ap_ui_evaluate_the_current_maintenance_results')))
    Column({ space: 14 }) {
      Text(evaluateFlowThresholds(this.maintenance).headline()).fontSize(18)
        .fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
      Text(this.checkHeadline()).fontSize(14)
        .fontColor('#667085').width('100%')
      Button(this.ruleDetailsOpen ? this.text($r('app.string.ap_ui_hide_check_details')) : this.text($r('app.string.ap_ui_check_details'))).id('apRulesDetailsToggle')
        .type(ButtonType.Normal).height(44).width('100%').fontSize(14)
        .fontColor('#246BFD').backgroundColor('#EEF4FF').borderRadius(12)
        .onClick((): void => { this.ruleDetailsOpen = !this.ruleDetailsOpen; })
      if (this.ruleDetailsOpen) {
        Text(this.text($r('app.string.ap_ui_threshold_evaluation'))).fontSize(16).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
        Text(this.thresholdHeadline()).fontSize(14).fontColor('#667085').width('100%')
        ForEach(this.thresholdLinesState(), (line: string) => {
          Text(line).fontSize(14).fontColor('#667085').width('100%')
        }, (line: string) => line)
        Text(this.text($r('app.string.ap_ui_regression_gate'))).fontSize(16).fontWeight(FontWeight.Medium).fontColor('#182238').width('100%')
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
    return this.text($r('app.string.ap_ui_format_321c6e2fd9'), [report.headline(), auditThresholds().summary(), entriesOfLevel(ThresholdLevel.MUST).length]);
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
    return this.text($r('app.string.ap_ui_format_f26b98675d'), [gateVerdictLabel(report.verdict()), report.blockers().length]) +
      this.text($r('app.string.ap_ui_format_73a4baf959'), [report.warnings().length, auditGate().summary()]);
  }

  private gateLinesState(): string[] {
    const lines: string[] = gateLevelLines();
    flowGateRules().forEach((rule): void => {
      lines.push(rule.text());
    });
    lines.push(this.text($r('app.string.ap_ui_format_23dfaf2486'), [gateMetrics().length]));
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
        this.bottomTab(this.text($r('app.string.ap_ui_memory_optimization')), 0)
        this.bottomTab(this.text($r('app.string.ap_ui_hypersnap')), 1)
        this.bottomTab(this.text($r('app.string.ap_ui_call_records')), 2)
        this.bottomTab(this.text($r('app.string.ap_ui_maintenance_plan')), 3)
        this.bottomTab(this.text($r('app.string.ap_ui_check_results')), 4)
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
