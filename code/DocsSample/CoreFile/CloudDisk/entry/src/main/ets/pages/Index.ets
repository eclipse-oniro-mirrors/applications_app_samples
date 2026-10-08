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

import { fileShare, fileUri, picker } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import cloudDisk, { SyncFolder, IsPlaceholderResult, CustomInfoResult } from 'libentry.so';
import { promptAction, PromptAction } from '@kit.ArkUI';
import { common, Want } from '@kit.AbilityKit';
import { BundleInfo, getBundleInfo } from '../common/Utils';

@Entry
@Component
struct Index {
  @State syncFolderPath: string = '';
  @State listenerFolderPath: string = '';
  private syncFolderUri: string = '';
  @State displayName: string = '';
  @State syncFolders: SyncFolder[] = [];
  @State phaseIndex: number = 0;
  private phaseController: TabsController = new TabsController();
  private context?: common.UIAbilityContext;
  private bundleInfo?: BundleInfo;
  promptAction: PromptAction = this.getUIContext().getPromptAction();

  private resStr(res: Resource): string {
    return getContext(this).resourceManager.getStringSync(res.id);
  }

  // 占位符与水合（CAPI）状态
  @State phase2ModuleIndex: number = 0;
  @State placeholderSyncPath: string = '';
  @State placeholderFilePath: string = '';
  @State placeholderAtimeMs: string = '0';
  @State placeholderMtimeMs: string = '0';
  @State placeholderLogicalSize: string = '0';
  @State isPlaceholderSyncPath: string = '';
  @State isPlaceholderFilePath: string = '';
  @State updatePlaceholderSyncPath: string = '';
  @State updatePlaceholderFilePath: string = '';
  @State updatePlaceholderAtimeMs: string = '0';
  @State updatePlaceholderMtimeMs: string = '0';
  @State updatePlaceholderLogicalSize: string = '0';
  @State convertPlaceholderSyncPath: string = '';
  @State convertPlaceholderFilePath: string = '';
  @State markFileSyncPath: string = '';
  @State markFilePath: string = '';
  @State unmarkFileSyncPath: string = '';
  @State unmarkFilePath: string = '';
  @State getCustomInfoSyncPath: string = '';
  @State getCustomInfoFilePath: string = '';
  @State customInfoResult: string = '';
  @State dehydrateSyncPath: string = '';
  @State dehydrateFilePath: string = '';
  @State hydrateSyncPath: string = '';
  @State hydrateFilePath: string = '';
  @State hydrateCallbackType: number = 0;
  @State registerCbSyncPath: string = '';
  @State registerCbFetchFilePath: string = '';
  @State unregisterCbSyncPath: string = '';
  @State executeCallbackType: number = 0;
  @State executeReqKey: number = 0;
  @State executeSyncPath: string = '';
  @State executeFilePath: string = '';
  @State executeFileContent: string = '';
  @State executeSize: string = '';
  @State executeOffset: string = '0';
  @State executeIsComplete: boolean = true;
  @State executeTotalSize: string = '';

  aboutToAppear(): void {
    this.displayName = this.resStr($r('app.string.default_display_name'));
    this.context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    this.bundleInfo = getBundleInfo();
    this.refreshSyncFolder();
    cloudDisk.registerCallback((msg: string) => {
      console.info('napi string callback get msg: ', msg);
    });
    if (this.syncFolders.length > 0) {
      this.syncFolderPath = this.syncFolders[0].path;
      AppStorage.setOrCreate('syncFolderPath', this.syncFolderPath);
    }
  }

  refreshSyncFolder() {
    let folders: SyncFolder[] | null = cloudDisk.getAllSyncFolder();
    this.syncFolders = folders ?? [];
  }

  async onButtonClick() {
    let file: fs.File | null = null;
    try {
      let options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      options.selectMode = picker.DocumentSelectMode.FOLDER;
      options.maxSelectNumber = 1;
      let documentPicker = new picker.DocumentViewPicker();
      let uris = await documentPicker.select(options);
      if (uris.length > 0) {
        let dirUri = uris[0];
        file = fs.openSync(dirUri);
        this.syncFolderPath = file.path;
        this.syncFolderUri = dirUri;
        AppStorage.setOrCreate('syncFolderPath', this.syncFolderPath);
        let policyInfo: fileShare.PolicyInfo = {
          uri: dirUri,
          operationMode: fileShare.OperationMode.READ_MODE | fileShare.OperationMode.WRITE_MODE,
        };
        let policies: fileShare.PolicyInfo[] = [policyInfo];
        fileShare.persistPermission(policies).then(() => {
          console.info('persistPermission successfully');
        }).catch((err: BusinessError<fileShare.PolicyErrorResult[]>) => {
          console.error('persistPermission failed: ' + err.message);
        });
      }
    } catch (error) {
      console.error('Picker Error: ' + (error as BusinessError).message);
    } finally {
      if (file) {
        fs.closeSync(file);
      }
    }
  }

  startNewPage(path: string) {
    if (this.bundleInfo && this.context) {
      let wantInfo: Want = {
        bundleName: this.bundleInfo.bundleName,
        abilityName: this.bundleInfo.abilityName,
        parameters: { page: path }
      };
      this.context.startAbility(wantInfo).then(() => {
        console.info('startAbility success.');
      }).catch((err: BusinessError) => {
        console.error('startAbility error:', JSON.stringify(err));
      });
    }
  }

  showResult(result: number) {
    if (result === 0) {
      this.promptAction.showDialog({ title: $r('app.string.execute_success'), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
    } else {
      this.promptAction.showDialog({
        title: $r('app.string.execute_failed'),
        message: this.resStr($r('app.string.error_code_label')) + result.toString() + '\n' + this.resStr($r('app.string.reason_label')) + this.getErrorCodeMsg(result),
        buttons: [{ text: $r('app.string.confirm'), color: '#000000' }]
      });
    }
  }

  private errorMap: Record<number, Resource> = {
    0: $r('app.string.err_0'), 201: $r('app.string.err_201'), 401: $r('app.string.err_401'),
    801: $r('app.string.err_801'), 34400001: $r('app.string.err_34400001'),
    34400002: $r('app.string.err_34400002'), 34400003: $r('app.string.err_34400003'),
    34400004: $r('app.string.err_34400004'), 34400005: $r('app.string.err_34400005'),
    34400006: $r('app.string.err_34400006'), 34400007: $r('app.string.err_34400007'),
    34400008: $r('app.string.err_34400008'), 34400010: $r('app.string.err_34400010'),
    34400014: $r('app.string.err_34400014'), 34400015: $r('app.string.err_34400015'),
    34400016: $r('app.string.err_34400016'), 34400017: $r('app.string.err_34400017'),
    34400018: $r('app.string.err_34400018'), 34400019: $r('app.string.err_34400019'),
    34400020: $r('app.string.err_34400020'), 34400021: $r('app.string.err_34400021'),
    34400022: $r('app.string.err_34400022'), 34400023: $r('app.string.err_34400023'),
    34400024: $r('app.string.err_34400024'),
  };

  getErrorCodeMsg(code: number): string {
    const res = this.errorMap[code];
    if (res) {
      return this.resStr(res);
    }
    return this.resStr($r('app.string.err_unknown')) + code.toString();
  }

  @Builder
  PhaseTabBuilder(title: ResourceStr, index: number) {
    Column() {
      Text(title)
        .fontColor(this.phaseIndex === index ? '#FFFFFF' : '#333333')
        .fontSize(16)
        .fontWeight(this.phaseIndex === index ? FontWeight.Bold : FontWeight.Normal)
    }
    .width('100%')
    .justifyContent(FlexAlign.Center)
    .padding(10)
    .backgroundColor(this.phaseIndex === index ? '#4CAF50' : '#E0E0E0')
    .borderRadius(6)
  }

  build() {
    Column() {
      Tabs({ controller: this.phaseController, barPosition: BarPosition.Start }) {
        // ========== 同步根管理 ==========
        TabContent() {
          Scroll() {
            Column() {
              Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                Text($r('app.string.register_path_label'))
                TextInput({ text: this.syncFolderPath })
                  .onChange((value: string) => {
                    this.syncFolderPath = value;
                    AppStorage.setOrCreate('syncFolderPath', this.syncFolderPath);
                  })
                  .width('40%')
                  .margin(10)
                Button($r('app.string.select_folder'))
                  .onClick(() => { this.onButtonClick(); })
                  .margin(10)
                Button($r('app.string.clear_all_sync_roots'))
                  .onClick(() => {
                    cloudDisk.unRegisterAllSyncFolder();
                    this.refreshSyncFolder();
                  })
                  .margin(10)
              }
              Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                Text($r('app.string.alias_label'))
                TextInput({ text: this.displayName, placeholder: $r('app.string.alias_input_placeholder') })
                  .onChange((value: string) => { this.displayName = value; })
                  .width('20%')
                  .margin(10)
                Button($r('app.string.register_sync_root'))
                  .onClick(() => {
                    this.showResult(cloudDisk.registerSyncFolder(this.syncFolderPath, this.displayName));
                    this.refreshSyncFolder();
                  })
                  .margin(10)
                Button($r('app.string.unregister_sync_root_btn'))
                  .onClick(() => {
                    this.showResult(cloudDisk.unRegisterSyncFolder(this.syncFolderPath));
                    this.syncFolderPath = '';
                    this.syncFolderUri = '';
                    AppStorage.setOrCreate('syncFolderPath', this.syncFolderPath);
                    this.refreshSyncFolder();
                  })
                  .margin(10)
                Button($r('app.string.activate_sync_root'))
                  .onClick(() => {
                    this.showResult(cloudDisk.activeSyncFolder(this.syncFolderPath));
                    this.refreshSyncFolder();
                  })
                  .margin(10)
                Button($r('app.string.deactivate_sync_root'))
                  .onClick(() => {
                    this.showResult(cloudDisk.deactiveSyncFolder(this.syncFolderPath));
                    this.refreshSyncFolder();
                  })
                  .margin(10)
                Button($r('app.string.modify_alias'))
                  .onClick(() => {
                    this.showResult(cloudDisk.updateDisplayName(this.syncFolderPath, this.displayName));
                    this.refreshSyncFolder();
                  })
                  .margin(10)
              }
              Column() {
                Row() {
                  Text($r('app.string.registered_sync_roots')).width('50%').textAlign(TextAlign.Start)
                  Text($r('app.string.status_label')).width('10%').textAlign(TextAlign.Center)
                  Text($r('app.string.resource_id_label')).width('10%').textAlign(TextAlign.Center)
                  Text($r('app.string.alias_column')).width('30%').textAlign(TextAlign.Center)
                }
                .padding(12)
                .backgroundColor('#f5f5f5')
                .border({ width: 1, color: '#ddd' })
                if (this.syncFolders.length > 0) {
                  List({ space: 0 }) {
                    ForEach(this.syncFolders, (syncFolder: SyncFolder) => {
                      ListItem() {
                        Row() {
                          Text(syncFolder.path).width('50%').textAlign(TextAlign.Start)
                          Text(syncFolder.state === 0 ? $r('app.string.not_activated') : $r('app.string.activated')).width('10%').textAlign(TextAlign.Center)
                          Text(syncFolder.displayNameResId.toString()).width('10%').textAlign(TextAlign.Center)
                          Text(syncFolder.displayName).width('30%').textAlign(TextAlign.Center)
                        }
                        .padding(12)
                        .border({ width: 1, color: '#ddd' })
                      }
                      .onClick(() => {
                        this.syncFolderPath = syncFolder.path;
                        AppStorage.setOrCreate('syncFolderPath', this.syncFolderPath);
                      })
                    }, (syncFolder: SyncFolder, index: number) => syncFolder.path + index.toString())
                  }
                } else {
                  Row() {
                    Text($r('app.string.no_sync_roots')).width('100%').textAlign(TextAlign.Center)
                  }
                  .padding(12)
                  .border({ width: 1, color: '#ddd' })
                }
              }
              Divider()
              Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                Text($r('app.string.listen_path_label'))
                TextInput({ text: this.listenerFolderPath })
                  .onChange((value: string) => { this.listenerFolderPath = value; })
                  .width('40%')
                  .margin(10)
                Button($r('app.string.register_listener'))
                  .onClick(() => { this.showResult(cloudDisk.registerSyncFolderChange(this.listenerFolderPath)); })
                  .margin(10)
                Button($r('app.string.unregister_listener'))
                  .onClick(() => { this.showResult(cloudDisk.unRegisterSyncFolderChange(this.listenerFolderPath)); })
                  .margin(10)
              }
              Flex({ direction: FlexDirection.Row }) {
                Button($r('app.string.read_operation_log'))
                  .onClick(() => { this.startNewPage('pages/OperationLog'); })
                  .margin(10)
                Button($r('app.string.set_sync_states'))
                  .onClick(() => { this.startNewPage('pages/SetFileSyncStates'); })
                  .margin(10)
                Button($r('app.string.get_sync_states'))
                  .onClick(() => { this.startNewPage('pages/GetFileSyncStates'); })
                  .margin(10)
              }
            }
          }
          .align(Alignment.Top)
        }.tabBar(this.PhaseTabBuilder($r('app.string.sync_root_management'), 0))

        // ========== 占位符与水合（CAPI）==========
        TabContent() {
          Row() {
            // 左侧菜单
            Column() {
              Text($r('app.string.function_module')).fontSize(16).fontWeight(FontWeight.Bold).margin({ top: 15, bottom: 15 })
              Scroll() {
                Column() {
                  Text($r('app.string.create_placeholder_file_full'))
                    .fontSize(12)
                    .fontColor(this.phase2ModuleIndex === 0 ? '#FFFFFF' : '#333333')
                    .fontWeight(this.phase2ModuleIndex === 0 ? FontWeight.Bold : FontWeight.Normal)
                    .padding(10).width('100%').textAlign(TextAlign.Center)
                    .backgroundColor(this.phase2ModuleIndex === 0 ? '#4CAF50' : '#E8E8E8')
                    .borderRadius(6).margin({ bottom: 6 })
                    .onClick(() => { this.phase2ModuleIndex = 0; })
                  Text($r('app.string.is_placeholder_file_full'))
                    .fontSize(12)
                    .fontColor(this.phase2ModuleIndex === 1 ? '#FFFFFF' : '#333333')
                    .fontWeight(this.phase2ModuleIndex === 1 ? FontWeight.Bold : FontWeight.Normal)
                    .padding(10).width('100%').textAlign(TextAlign.Center)
                    .backgroundColor(this.phase2ModuleIndex === 1 ? '#4CAF50' : '#E8E8E8')
                    .borderRadius(6).margin({ bottom: 6 })
                    .onClick(() => { this.phase2ModuleIndex = 1; })
                  Text($r('app.string.update_placeholder_full'))
                    .fontSize(12)
                    .fontColor(this.phase2ModuleIndex === 2 ? '#FFFFFF' : '#333333')
                    .fontWeight(this.phase2ModuleIndex === 2 ? FontWeight.Bold : FontWeight.Normal)
                    .padding(10).width('100%').textAlign(TextAlign.Center)
                    .backgroundColor(this.phase2ModuleIndex === 2 ? '#4CAF50' : '#E8E8E8')
                    .borderRadius(6).margin({ bottom: 6 })
                    .onClick(() => { this.phase2ModuleIndex = 2; })
                  Text($r('app.string.convert_placeholder_full'))
                    .fontSize(12)
                    .fontColor(this.phase2ModuleIndex === 3 ? '#FFFFFF' : '#333333')
                    .fontWeight(this.phase2ModuleIndex === 3 ? FontWeight.Bold : FontWeight.Normal)
                    .padding(10).width('100%').textAlign(TextAlign.Center)
                    .backgroundColor(this.phase2ModuleIndex === 3 ? '#4CAF50' : '#E8E8E8')
                    .borderRadius(6).margin({ bottom: 6 })
                    .onClick(() => { this.phase2ModuleIndex = 3; })
                  Text($r('app.string.mark_file_full'))
                    .fontSize(12)
                    .fontColor(this.phase2ModuleIndex === 4 ? '#FFFFFF' : '#333333')
                    .fontWeight(this.phase2ModuleIndex === 4 ? FontWeight.Bold : FontWeight.Normal)
                    .padding(10).width('100%').textAlign(TextAlign.Center)
                    .backgroundColor(this.phase2ModuleIndex === 4 ? '#4CAF50' : '#E8E8E8')
                    .borderRadius(6).margin({ bottom: 6 })
                    .onClick(() => { this.phase2ModuleIndex = 4; })
                  Text($r('app.string.unmark_placeholder_full'))
                    .fontSize(12)
                    .fontColor(this.phase2ModuleIndex === 5 ? '#FFFFFF' : '#333333')
                    .fontWeight(this.phase2ModuleIndex === 5 ? FontWeight.Bold : FontWeight.Normal)
                    .padding(10).width('100%').textAlign(TextAlign.Center)
                    .backgroundColor(this.phase2ModuleIndex === 5 ? '#4CAF50' : '#E8E8E8')
                    .borderRadius(6).margin({ bottom: 6 })
                    .onClick(() => { this.phase2ModuleIndex = 5; })
                  Text($r('app.string.get_custom_info_full'))
                    .fontSize(12)
                    .fontColor(this.phase2ModuleIndex === 6 ? '#FFFFFF' : '#333333')
                    .fontWeight(this.phase2ModuleIndex === 6 ? FontWeight.Bold : FontWeight.Normal)
                    .padding(10).width('100%').textAlign(TextAlign.Center)
                    .backgroundColor(this.phase2ModuleIndex === 6 ? '#4CAF50' : '#E8E8E8')
                    .borderRadius(6).margin({ bottom: 6 })
                    .onClick(() => { this.phase2ModuleIndex = 6; })
                  Text($r('app.string.dehydrate_file_full'))
                    .fontSize(12)
                    .fontColor(this.phase2ModuleIndex === 7 ? '#FFFFFF' : '#333333')
                    .fontWeight(this.phase2ModuleIndex === 7 ? FontWeight.Bold : FontWeight.Normal)
                    .padding(10).width('100%').textAlign(TextAlign.Center)
                    .backgroundColor(this.phase2ModuleIndex === 7 ? '#4CAF50' : '#E8E8E8')
                    .borderRadius(6).margin({ bottom: 6 })
                    .onClick(() => { this.phase2ModuleIndex = 7; })
                  Text($r('app.string.hydrate_placeholder_full'))
                    .fontSize(12)
                    .fontColor(this.phase2ModuleIndex === 8 ? '#FFFFFF' : '#333333')
                    .fontWeight(this.phase2ModuleIndex === 8 ? FontWeight.Bold : FontWeight.Normal)
                    .padding(10).width('100%').textAlign(TextAlign.Center)
                    .backgroundColor(this.phase2ModuleIndex === 8 ? '#4CAF50' : '#E8E8E8')
                    .borderRadius(6).margin({ bottom: 6 })
                    .onClick(() => { this.phase2ModuleIndex = 8; })
                  Text($r('app.string.register_callback_full'))
                    .fontSize(12)
                    .fontColor(this.phase2ModuleIndex === 9 ? '#FFFFFF' : '#333333')
                    .fontWeight(this.phase2ModuleIndex === 9 ? FontWeight.Bold : FontWeight.Normal)
                    .padding(10).width('100%').textAlign(TextAlign.Center)
                    .backgroundColor(this.phase2ModuleIndex === 9 ? '#4CAF50' : '#E8E8E8')
                    .borderRadius(6).margin({ bottom: 6 })
                    .onClick(() => { this.phase2ModuleIndex = 9; })
                  Text($r('app.string.unregister_callback_full'))
                    .fontSize(12)
                    .fontColor(this.phase2ModuleIndex === 10 ? '#FFFFFF' : '#333333')
                    .fontWeight(this.phase2ModuleIndex === 10 ? FontWeight.Bold : FontWeight.Normal)
                    .padding(10).width('100%').textAlign(TextAlign.Center)
                    .backgroundColor(this.phase2ModuleIndex === 10 ? '#4CAF50' : '#E8E8E8')
                    .borderRadius(6).margin({ bottom: 6 })
                    .onClick(() => { this.phase2ModuleIndex = 10; })
                  Text($r('app.string.execute_full'))
                    .fontSize(12)
                    .fontColor(this.phase2ModuleIndex === 11 ? '#FFFFFF' : '#333333')
                    .fontWeight(this.phase2ModuleIndex === 11 ? FontWeight.Bold : FontWeight.Normal)
                    .padding(10).width('100%').textAlign(TextAlign.Center)
                    .backgroundColor(this.phase2ModuleIndex === 11 ? '#4CAF50' : '#E8E8E8')
                    .borderRadius(6).margin({ bottom: 6 })
                    .onClick(() => { this.phase2ModuleIndex = 11; })
                }.width('100%')
              }
              .scrollBar(BarState.Auto)
              .layoutWeight(1)
            }
            .width('30%')
            .height('100%')
            .backgroundColor('#F5F5F5')
            .padding(10)

            // 右侧表单
            Scroll() {
              Column() {
                if (this.phase2ModuleIndex === 0) {
                  Text($r('app.string.create_placeholder_file_title')).fontSize(18).fontWeight(FontWeight.Bold).margin({ top: 10, bottom: 15 })
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.sync_root_path_label'))
                    TextInput({ text: this.placeholderSyncPath, placeholder: $r('app.string.registered_sync_root_path') })
                      .onChange((value: string) => { this.placeholderSyncPath = value; })
                      .width('80%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.file_relative_path_label'))
                    TextInput({ text: this.placeholderFilePath, placeholder: $r('app.string.sync_root_relative_path') })
                      .onChange((value: string) => { this.placeholderFilePath = value; })
                      .width('75%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text('atimeMs：')
                    TextInput({ text: this.placeholderAtimeMs, placeholder: $r('app.string.access_time_ms') })
                      .type(InputType.Number)
                      .onChange((value: string) => { this.placeholderAtimeMs = value; })
                      .width('25%').margin(10)
                    Text('mtimeMs：')
                    TextInput({ text: this.placeholderMtimeMs, placeholder: $r('app.string.modify_time_ms') })
                      .type(InputType.Number)
                      .onChange((value: string) => { this.placeholderMtimeMs = value; })
                      .width('25%').margin(10)
                    Text('logicalSize：')
                    TextInput({ text: this.placeholderLogicalSize, placeholder: $r('app.string.logical_size_bytes') })
                      .type(InputType.Number)
                      .onChange((value: string) => { this.placeholderLogicalSize = value; })
                      .width('25%').margin(10)
                  }
                  Row() {
                    Button($r('app.string.create_placeholder_btn'))
                      .onClick(() => {
                        let ret: number = cloudDisk.createPlaceholderFile(
                          this.placeholderSyncPath, this.placeholderFilePath,
                          parseInt(this.placeholderAtimeMs) || 0,
                          parseInt(this.placeholderMtimeMs) || 0,
                          parseInt(this.placeholderLogicalSize) || 0
                        );
                        if (ret === 0) {
                          this.promptAction.showDialog({ title: $r('app.string.create_success'), buttons: [{ text: $r('app.string.ok'), color: '#000000' }] });
                        } else {
                          this.promptAction.showDialog({ title: $r('app.string.create_failed'), message: this.resStr($r('app.string.error_code_label')) + ret.toString(), buttons: [{ text: $r('app.string.ok'), color: '#000000' }] });
                        }
                      })
                    Button($r('app.string.batch_create_50w'))
                      .backgroundColor('#FF9800')
                      .onClick(() => {
                        let totalCount = 500000;
                        let totalCreateTime = 0;
                        let successCount = 0;
                        let failCount = 0;
                        let firstFailCode = -1;
                        for (let i = 1; i <= totalCount; i++) {
                          let relativePath = i.toString() + '.txt';
                          let t0 = Date.now();
                          let ret: number = cloudDisk.createPlaceholderFile(
                            this.placeholderSyncPath, relativePath,
                            parseInt(this.placeholderAtimeMs) || 0,
                            parseInt(this.placeholderMtimeMs) || 0,
                            parseInt(this.placeholderLogicalSize) || 0
                          );
                          totalCreateTime += Date.now() - t0;
                          if (ret === 0) {
                            successCount++;
                          } else {
                            failCount++;
                            if (firstFailCode === -1) { firstFailCode = ret; }
                          }
                          if (i % 100000 === 0) {
                            console.info('progress: ' + i.toString() + '/' + totalCount.toString() +
                              ' avg=' + (totalCreateTime / i).toFixed(2) + 'ms/op');
                          }
                        }
                        this.promptAction.showDialog({
                          title: $r('app.string.batch_create_50w_done'),
                          message: 'success: ' + successCount.toString() + ' fail: ' + failCount.toString() +
                            (firstFailCode >= 0 ? ' firstErr: ' + firstFailCode.toString() : '') +
                            ' totalTime: ' + totalCreateTime.toString() + 'ms' +
                            ' avg: ' + (totalCreateTime / totalCount).toFixed(2) + 'ms/op',
                          buttons: [{ text: $r('app.string.ok'), color: '#000000' }]
                        });
                      })
                  }.margin(10)
                } else if (this.phase2ModuleIndex === 1) {
                  Text($r('app.string.is_placeholder_file_title')).fontSize(18).fontWeight(FontWeight.Bold).margin({ top: 10, bottom: 15 })
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.sync_root_path_label'))
                    TextInput({ text: this.isPlaceholderSyncPath, placeholder: $r('app.string.registered_sync_root_path') })
                      .onChange((value: string) => { this.isPlaceholderSyncPath = value; })
                      .width('80%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.file_relative_path_label'))
                    TextInput({ text: this.isPlaceholderFilePath, placeholder: $r('app.string.sync_root_relative_path') })
                      .onChange((value: string) => { this.isPlaceholderFilePath = value; })
                      .width('75%').margin(10)
                  }
                  Button($r('app.string.judge_btn'))
                    .onClick(() => {
                      let ret: IsPlaceholderResult = cloudDisk.isPlaceholderFile(this.isPlaceholderSyncPath, this.isPlaceholderFilePath);
                      if (ret.code === 0) {
                        this.promptAction.showDialog({ title: $r('app.string.judge_result'), message: ret.isPlaceholder ? this.resStr($r('app.string.is_placeholder')) : this.resStr($r('app.string.not_placeholder')), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      } else {
                        this.promptAction.showDialog({ title: $r('app.string.judge_failed'), message: this.resStr($r('app.string.error_code_label')) + ret.code.toString() + '\n' + this.resStr($r('app.string.reason_label')) + this.getErrorCodeMsg(ret.code), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      }
                    })
                    .margin(10)
                  Button($r('app.string.batch_judge_50w'))
                    .backgroundColor('#FF9800')
                    .onClick(() => {
                      let totalCount = 500000;
                      let totalTime = 0;
                      let successCount = 0;
                      let failCount = 0;
                      let placeholderTrueCount = 0;
                      let firstFailCode = -1;
                      for (let i = 1; i <= totalCount; i++) {
                        let relativePath = i.toString() + '.txt';
                        let t0 = Date.now();
                        let ret: IsPlaceholderResult = cloudDisk.isPlaceholderFile(this.isPlaceholderSyncPath, relativePath);
                        totalTime += Date.now() - t0;
                        if (ret.code === 0) {
                          successCount++;
                          if (ret.isPlaceholder) { placeholderTrueCount++; }
                        } else {
                          failCount++;
                          if (firstFailCode === -1) { firstFailCode = ret.code; }
                        }
                        if (i % 100000 === 0) {
                          console.info('progress: ' + i.toString() + '/' + totalCount.toString() +
                            ' avg=' + (totalTime / i).toFixed(2) + 'ms/op');
                        }
                      }
                      this.promptAction.showDialog({
                        title: $r('app.string.batch_judge_50w_done'),
                        message: 'success: ' + successCount.toString() + ' fail: ' + failCount.toString() +
                          ' placeholderTrue: ' + placeholderTrueCount.toString() +
                          (firstFailCode >= 0 ? ' firstErr: ' + firstFailCode.toString() : '') +
                          ' totalTime: ' + totalTime.toString() + 'ms' +
                          ' avg: ' + (totalTime / totalCount).toFixed(2) + 'ms/op',
                        buttons: [{ text: $r('app.string.ok'), color: '#000000' }]
                      });
                    })
                } else if (this.phase2ModuleIndex === 2) {
                  Text($r('app.string.update_placeholder_metadata')).fontSize(18).fontWeight(FontWeight.Bold).margin({ top: 10, bottom: 15 })
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.sync_root_path_label'))
                    TextInput({ text: this.updatePlaceholderSyncPath, placeholder: $r('app.string.registered_sync_root_path') })
                      .onChange((value: string) => { this.updatePlaceholderSyncPath = value; })
                      .width('80%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.file_relative_path_label'))
                    TextInput({ text: this.updatePlaceholderFilePath, placeholder: $r('app.string.sync_root_relative_path') })
                      .onChange((value: string) => { this.updatePlaceholderFilePath = value; })
                      .width('75%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text('atimeMs：')
                    TextInput({ text: this.updatePlaceholderAtimeMs, placeholder: $r('app.string.access_time_ms') })
                      .type(InputType.Number)
                      .onChange((value: string) => { this.updatePlaceholderAtimeMs = value; })
                      .width('25%').margin(10)
                    Text('mtimeMs：')
                    TextInput({ text: this.updatePlaceholderMtimeMs, placeholder: $r('app.string.modify_time_ms') })
                      .type(InputType.Number)
                      .onChange((value: string) => { this.updatePlaceholderMtimeMs = value; })
                      .width('25%').margin(10)
                    Text('logicalSize：')
                    TextInput({ text: this.updatePlaceholderLogicalSize, placeholder: $r('app.string.logical_size_bytes') })
                      .type(InputType.Number)
                      .onChange((value: string) => { this.updatePlaceholderLogicalSize = value; })
                      .width('25%').margin(10)
                  }
                  Row() {
                    Button($r('app.string.update_placeholder_btn'))
                      .onClick(() => {
                        let ret: number = cloudDisk.updatePlaceholder(
                          this.updatePlaceholderSyncPath, this.updatePlaceholderFilePath,
                          parseInt(this.updatePlaceholderAtimeMs) || 0,
                          parseInt(this.updatePlaceholderMtimeMs) || 0,
                          parseInt(this.updatePlaceholderLogicalSize) || 0
                        );
                        if (ret === 0) {
                          this.promptAction.showDialog({ title: $r('app.string.update_success'), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                        } else {
                          this.promptAction.showDialog({ title: $r('app.string.update_failed'), message: this.resStr($r('app.string.error_code_label')) + ret.toString() + '\n' + this.resStr($r('app.string.reason_label')) + this.getErrorCodeMsg(ret), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                        }
                      })
                    Button($r('app.string.batch_update_50w'))
                      .backgroundColor('#FF9800')
                      .onClick(() => {
                        let totalCount = 500000;
                        let totalTime = 0;
                        let successCount = 0;
                        let failCount = 0;
                        let firstFailCode = -1;
                        for (let i = 1; i <= totalCount; i++) {
                          let relativePath = i.toString() + '.txt';
                          let t0 = Date.now();
                          let ret: number = cloudDisk.updatePlaceholder(
                            this.updatePlaceholderSyncPath, relativePath,
                            parseInt(this.updatePlaceholderAtimeMs) || 0,
                            parseInt(this.updatePlaceholderMtimeMs) || 0,
                            parseInt(this.updatePlaceholderLogicalSize) || 0
                          );
                          totalTime += Date.now() - t0;
                          if (ret === 0) {
                            successCount++;
                          } else {
                            failCount++;
                            if (firstFailCode === -1) { firstFailCode = ret; }
                          }
                          if (i % 100000 === 0) {
                            console.info('progress: ' + i.toString() + '/' + totalCount.toString() +
                              ' avg=' + (totalTime / i).toFixed(2) + 'ms/op');
                          }
                        }
                        this.promptAction.showDialog({
                          title: $r('app.string.batch_update_50w_done'),
                          message: 'success: ' + successCount.toString() + ' fail: ' + failCount.toString() +
                            (firstFailCode >= 0 ? ' firstErr: ' + firstFailCode.toString() : '') +
                            ' totalTime: ' + totalTime.toString() + 'ms' +
                            ' avg: ' + (totalTime / totalCount).toFixed(2) + 'ms/op',
                          buttons: [{ text: $r('app.string.ok'), color: '#000000' }]
                        });
                      })
                  }.margin(10)
                } else if (this.phase2ModuleIndex === 3) {
                  Text($r('app.string.convert_to_regular_file')).fontSize(18).fontWeight(FontWeight.Bold).margin({ top: 10, bottom: 15 })
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.sync_root_path_label'))
                    TextInput({ text: this.convertPlaceholderSyncPath, placeholder: $r('app.string.registered_sync_root_path') })
                      .onChange((value: string) => { this.convertPlaceholderSyncPath = value; })
                      .width('80%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.file_relative_path_label'))
                    TextInput({ text: this.convertPlaceholderFilePath, placeholder: $r('app.string.sync_root_relative_path') })
                      .onChange((value: string) => { this.convertPlaceholderFilePath = value; })
                      .width('75%').margin(10)
                  }
                  Row() {
                    Button($r('app.string.convert_btn'))
                      .onClick(() => {
                        let ret: number = cloudDisk.convertPlaceholderToFile(this.convertPlaceholderSyncPath, this.convertPlaceholderFilePath);
                        if (ret === 0) {
                          this.promptAction.showDialog({ title: $r('app.string.convert_success'), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                        } else {
                          this.promptAction.showDialog({ title: $r('app.string.convert_failed'), message: this.resStr($r('app.string.error_code_label')) + ret.toString() + '\n' + this.resStr($r('app.string.reason_label')) + this.getErrorCodeMsg(ret), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                        }
                      })
                    Button($r('app.string.batch_convert_50w'))
                      .backgroundColor('#FF9800')
                      .onClick(() => {
                        let totalCount = 500000;
                        let totalTime = 0;
                        let successCount = 0;
                        let failCount = 0;
                        let firstFailCode = -1;
                        for (let i = 1; i <= totalCount; i++) {
                          let relativePath = i.toString() + '.txt';
                          let t0 = Date.now();
                          let ret: number = cloudDisk.convertPlaceholderToFile(this.convertPlaceholderSyncPath, relativePath);
                          totalTime += Date.now() - t0;
                          if (ret === 0) {
                            successCount++;
                          } else {
                            failCount++;
                            if (firstFailCode === -1) { firstFailCode = ret; }
                          }
                          if (i % 100000 === 0) {
                            console.info('progress: ' + i.toString() + '/' + totalCount.toString() +
                              ' avg=' + (totalTime / i).toFixed(2) + 'ms/op');
                          }
                        }
                        this.promptAction.showDialog({
                          title: $r('app.string.batch_convert_50w_done'),
                          message: 'success: ' + successCount.toString() + ' fail: ' + failCount.toString() +
                            (firstFailCode >= 0 ? ' firstErr: ' + firstFailCode.toString() : '') +
                            ' totalTime: ' + totalTime.toString() + 'ms' +
                            ' avg: ' + (totalTime / totalCount).toFixed(2) + 'ms/op',
                          buttons: [{ text: $r('app.string.ok'), color: '#000000' }]
                        });
                      })
                  }.margin(10)
                } else if (this.phase2ModuleIndex === 4) {
                  Text($r('app.string.mark_file_as_placeholder')).fontSize(18).fontWeight(FontWeight.Bold).margin({ top: 10, bottom: 15 })
                  Text($r('app.string.mark_file_subtitle')).fontSize(12).fontColor('#888888').margin({ bottom: 10 })
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.sync_root_path_label'))
                    TextInput({ text: this.markFileSyncPath, placeholder: $r('app.string.registered_sync_root_path') })
                      .onChange((value: string) => { this.markFileSyncPath = value; })
                      .width('80%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.file_relative_path_label'))
                    TextInput({ text: this.markFilePath, placeholder: $r('app.string.sync_root_relative_path') })
                      .onChange((value: string) => { this.markFilePath = value; })
                      .width('75%').margin(10)
                  }
                  Button($r('app.string.mark_btn'))
                    .onClick(() => {
                      let ret: number = cloudDisk.markFileAsPlaceholder(this.markFileSyncPath, this.markFilePath);
                      if (ret === 0) {
                        this.promptAction.showDialog({ title: $r('app.string.mark_success'), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      } else {
                        this.promptAction.showDialog({ title: $r('app.string.mark_failed'), message: this.resStr($r('app.string.error_code_label')) + ret.toString() + '\n' + this.resStr($r('app.string.reason_label')) + this.getErrorCodeMsg(ret), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      }
                    })
                    .margin(10)
                } else if (this.phase2ModuleIndex === 5) {
                  Text($r('app.string.unmark_placeholder_title')).fontSize(18).fontWeight(FontWeight.Bold).margin({ top: 10, bottom: 15 })
                  Text($r('app.string.unmark_subtitle')).fontSize(12).fontColor('#888888').margin({ bottom: 10 })
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.sync_root_path_label'))
                    TextInput({ text: this.unmarkFileSyncPath, placeholder: $r('app.string.registered_sync_root_path') })
                      .onChange((value: string) => { this.unmarkFileSyncPath = value; })
                      .width('80%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.file_relative_path_label'))
                    TextInput({ text: this.unmarkFilePath, placeholder: $r('app.string.sync_root_relative_path') })
                      .onChange((value: string) => { this.unmarkFilePath = value; })
                      .width('75%').margin(10)
                  }
                  Button($r('app.string.unmark_btn'))
                    .onClick(() => {
                      let ret: number = cloudDisk.unmarkPlaceholderFile(this.unmarkFileSyncPath, this.unmarkFilePath);
                      if (ret === 0) {
                        this.promptAction.showDialog({ title: $r('app.string.unmark_success'), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      } else {
                        this.promptAction.showDialog({ title: $r('app.string.unmark_failed'), message: this.resStr($r('app.string.error_code_label')) + ret.toString() + '\n' + this.resStr($r('app.string.reason_label')) + this.getErrorCodeMsg(ret), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      }
                    })
                    .margin(10)
                } else if (this.phase2ModuleIndex === 6) {
                  Text($r('app.string.get_custom_info_title')).fontSize(18).fontWeight(FontWeight.Bold).margin({ top: 10, bottom: 15 })
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.sync_root_path_label'))
                    TextInput({ text: this.getCustomInfoSyncPath, placeholder: $r('app.string.registered_sync_root_path') })
                      .onChange((value: string) => { this.getCustomInfoSyncPath = value; })
                      .width('80%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.file_relative_path_label'))
                    TextInput({ text: this.getCustomInfoFilePath, placeholder: $r('app.string.sync_root_relative_path') })
                      .onChange((value: string) => { this.getCustomInfoFilePath = value; })
                      .width('75%').margin(10)
                  }
                  Button($r('app.string.get_custom_info_btn'))
                    .onClick(() => {
                      let ret: CustomInfoResult = cloudDisk.getPlaceholderCustomInfo(this.getCustomInfoSyncPath, this.getCustomInfoFilePath);
                      if (ret.code === 0) {
                        this.customInfoResult = 'dataLength: ' + ret.dataLength.toString() + '\ndata: ' + ret.data;
                        this.promptAction.showDialog({ title: $r('app.string.get_success'), message: 'dataLength: ' + ret.dataLength.toString() + '\ndata: ' + ret.data, buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      } else {
                        this.customInfoResult = this.resStr($r('app.string.error_code_label')) + ret.code.toString();
                        this.promptAction.showDialog({ title: $r('app.string.get_failed'), message: this.resStr($r('app.string.error_code_label')) + ret.code.toString() + '\n' + this.resStr($r('app.string.reason_label')) + this.getErrorCodeMsg(ret.code), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      }
                    })
                    .margin(10)
                } else if (this.phase2ModuleIndex === 7) {
                  Text($r('app.string.dehydrate_file_title')).fontSize(18).fontWeight(FontWeight.Bold).margin({ top: 10, bottom: 15 })
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.sync_root_path_label'))
                    TextInput({ text: this.dehydrateSyncPath, placeholder: $r('app.string.registered_sync_root_path') })
                      .onChange((value: string) => { this.dehydrateSyncPath = value; })
                      .width('80%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.file_relative_path_label'))
                    TextInput({ text: this.dehydrateFilePath, placeholder: $r('app.string.sync_root_relative_path') })
                      .onChange((value: string) => { this.dehydrateFilePath = value; })
                      .width('75%').margin(10)
                  }
                  Button($r('app.string.dehydrate_btn'))
                    .onClick(() => {
                      let ret: number = cloudDisk.dehydrateFile(this.dehydrateSyncPath, this.dehydrateFilePath);
                      if (ret === 0) {
                        this.promptAction.showDialog({ title: $r('app.string.dehydrate_success'), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      } else {
                        this.promptAction.showDialog({ title: $r('app.string.dehydrate_failed'), message: this.resStr($r('app.string.error_code_label')) + ret.toString() + '\n' + this.resStr($r('app.string.reason_label')) + this.getErrorCodeMsg(ret), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      }
                    })
                    .margin(10)
                } else if (this.phase2ModuleIndex === 8) {
                  Text($r('app.string.hydrate_placeholder_title')).fontSize(18).fontWeight(FontWeight.Bold).margin({ top: 10, bottom: 15 })
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.sync_root_path_label'))
                    TextInput({ text: this.hydrateSyncPath, placeholder: $r('app.string.registered_sync_root_path') })
                      .onChange((value: string) => { this.hydrateSyncPath = value; })
                      .width('80%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.file_relative_path_label'))
                    TextInput({ text: this.hydrateFilePath, placeholder: $r('app.string.sync_root_relative_path') })
                      .onChange((value: string) => { this.hydrateFilePath = value; })
                      .width('75%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.callback_type_label'))
                    TextInput({ text: this.hydrateCallbackType.toString(), placeholder: $r('app.string.callback_type_placeholder') })
                      .type(InputType.Number)
                      .onChange((value: string) => { this.hydrateCallbackType = parseInt(value) || 0; })
                      .width('75%').margin(10)
                  }
                  Button($r('app.string.hydrate_btn'))
                    .onClick(() => {
                      console.info('hydratePlaceholder start');
                      let versionBefore: number = cloudDisk.getCallbackReqKeyVersion();
                      let ret: number = cloudDisk.hydratePlaceholder(this.hydrateSyncPath, this.hydrateFilePath, this.hydrateCallbackType);
                      console.info('hydratePlaceholder end, ret: ' + ret);
                      if (ret === 0) {
                        // Callback (async IPC) arrives a few ms after hydrate returns.
                        // Poll version until it changes, then read the fresh reqKey.
                        const pollReqKey = (attempt: number): void => {
                          let versionAfter: number = cloudDisk.getCallbackReqKeyVersion();
                          if (versionAfter !== versionBefore || attempt >= 30) {
                            this.executeReqKey = cloudDisk.getCallbackReqKey();
                            console.info('reqKey ready, version=' + versionAfter + ' attempt=' + attempt + ' executeReqKey: ' + this.executeReqKey);
                            this.promptAction.showDialog({ title: this.resStr($r('app.string.hydrate_success_prefix')) + this.executeReqKey.toString() + '\n(version=' + versionAfter + ')', buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                          } else {
                            setTimeout((): void => { pollReqKey(attempt + 1); }, 100);
                          }
                        };
                        pollReqKey(0);
                      } else {
                        this.executeReqKey = cloudDisk.getCallbackReqKey();
                        this.promptAction.showDialog({ title: $r('app.string.hydrate_failed'), message: this.resStr($r('app.string.error_code_label')) + ret.toString() + '\n' + this.resStr($r('app.string.reason_label')) + this.getErrorCodeMsg(ret) + '\n' + this.resStr($r('app.string.callback_reqkey_label')) + this.executeReqKey.toString(), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      }
                    })
                    .margin(10)
                } else if (this.phase2ModuleIndex === 9) {
                  Text($r('app.string.register_callback_table')).fontSize(18).fontWeight(FontWeight.Bold).margin({ top: 10, bottom: 15 })
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.sync_root_path_label'))
                    TextInput({ text: this.registerCbSyncPath, placeholder: $r('app.string.registered_sync_root_path') })
                      .onChange((value: string) => { this.registerCbSyncPath = value; })
                      .width('80%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.fetch_file_label'))
                    TextInput({ text: this.registerCbFetchFilePath, placeholder: $r('app.string.fetch_file_placeholder') })
                      .onChange((value: string) => { this.registerCbFetchFilePath = value; })
                      .width('90%').margin(10)
                  }
                  Button($r('app.string.register_btn'))
                    .onClick(() => {
                      let ret: number = cloudDisk.registerCallbackTable(this.registerCbSyncPath, this.registerCbFetchFilePath);
                      if (ret === 0) {
                        this.promptAction.showDialog({ title: $r('app.string.register_success'), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      } else {
                        this.promptAction.showDialog({ title: $r('app.string.register_failed'), message: this.resStr($r('app.string.error_code_label')) + ret.toString() + '\n' + this.resStr($r('app.string.reason_label')) + this.getErrorCodeMsg(ret), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      }
                    })
                    .margin(10)
                } else if (this.phase2ModuleIndex === 10) {
                  Text($r('app.string.unregister_callback_table')).fontSize(18).fontWeight(FontWeight.Bold).margin({ top: 10, bottom: 15 })
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.sync_root_path_label'))
                    TextInput({ text: this.unregisterCbSyncPath, placeholder: $r('app.string.registered_sync_root_path') })
                      .onChange((value: string) => { this.unregisterCbSyncPath = value; })
                      .width('80%').margin(10)
                  }
                  Button($r('app.string.unregister_btn'))
                    .onClick(() => {
                      let ret: number = cloudDisk.unregisterCallbackTable(this.unregisterCbSyncPath);
                      if (ret === 0) {
                        this.promptAction.showDialog({ title: $r('app.string.unregister_success'), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      } else {
                        this.promptAction.showDialog({ title: $r('app.string.unregister_failed'), message: this.resStr($r('app.string.error_code_label')) + ret.toString() + '\n' + this.resStr($r('app.string.reason_label')) + this.getErrorCodeMsg(ret), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      }
                    })
                    .margin(10)
                } else if (this.phase2ModuleIndex === 11) {
                  Text($r('app.string.execute_title')).fontSize(18).fontWeight(FontWeight.Bold).margin({ top: 10, bottom: 15 })
                  Text('CloudDisk_CallbackReqHead:').fontSize(14).fontWeight(FontWeight.Bold).margin({ top: 5, bottom: 5 })
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.callback_type_label'))
                    TextInput({ text: this.executeCallbackType.toString(), placeholder: $r('app.string.callback_type_placeholder2') })
                      .type(InputType.Number)
                      .onChange((value: string) => { this.executeCallbackType = parseInt(value) || 0; })
                      .width('75%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text('reqKey：')
                    TextInput({ text: this.executeReqKey.toString(), placeholder: $r('app.string.reqkey_placeholder') })
                      .type(InputType.Number)
                      .onChange((value: string) => { this.executeReqKey = parseInt(value) || 0; })
                      .width('75%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.sync_root_path_label'))
                    TextInput({ text: this.executeSyncPath, placeholder: $r('app.string.registered_sync_root_path') })
                      .onChange((value: string) => { this.executeSyncPath = value; })
                      .width('75%').margin(10)
                  }
                  Text('CloudDisk_CallbackContext:').fontSize(14).fontWeight(FontWeight.Bold).margin({ top: 5, bottom: 5 })
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.file_relative_path_label'))
                    TextInput({ text: this.executeFilePath, placeholder: $r('app.string.placeholder_relative_path') })
                      .onChange((value: string) => { this.executeFilePath = value; })
                      .width('75%').margin(10)
                  }
                  Text('CloudDisk_CallbackResponse (FetchData):').fontSize(14).fontWeight(FontWeight.Bold).margin({ top: 5, bottom: 5 })
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.file_content_label'))
                    TextInput({ text: this.executeFileContent, placeholder: $r('app.string.file_content_placeholder') })
                      .onChange((value: string) => {
                        this.executeFileContent = value;
                        this.executeSize = value.length.toString();
                        if (this.executeTotalSize === '' || this.executeTotalSize === '0') {
                          this.executeTotalSize = value.length.toString();
                        }
                      })
                      .width('75%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text($r('app.string.size_editable_label'))
                    TextInput({ text: this.executeSize, placeholder: $r('app.string.size_placeholder') })
                      .type(InputType.Number)
                      .onChange((value: string) => { this.executeSize = value; })
                      .width('75%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text('totalSize：')
                    TextInput({ text: this.executeTotalSize, placeholder: $r('app.string.total_size_placeholder') })
                      .type(InputType.Number)
                      .onChange((value: string) => { this.executeTotalSize = value; })
                      .width('75%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text('offset：')
                    TextInput({ text: this.executeOffset, placeholder: '0' })
                      .type(InputType.Number)
                      .onChange((value: string) => { this.executeOffset = value; })
                      .width('75%').margin(10)
                  }
                  Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                    Text('isComplete：')
                    Toggle({ type: ToggleType.Switch, isOn: this.executeIsComplete })
                      .onChange((isOn: boolean) => { this.executeIsComplete = isOn; })
                      .margin(10)
                  }
                  Button($r('app.string.execute_btn'))
                    .onClick(() => {
                      let ret: number = cloudDisk.execute(
                        this.executeCallbackType,
                        this.executeReqKey,
                        this.executeSyncPath,
                        this.executeFilePath,
                        this.executeFileContent,
                        parseInt(this.executeOffset) || 0,
                        parseInt(this.executeSize) || 0,
                        this.executeIsComplete,
                        parseInt(this.executeTotalSize) || parseInt(this.executeSize) || 0
                      );
                      if (ret === 0) {
                        this.promptAction.showDialog({ title: $r('app.string.execute_success_msg'), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      } else {
                        this.promptAction.showDialog({ title: $r('app.string.execute_failed_msg'), message: this.resStr($r('app.string.error_code_label')) + ret.toString() + '\n' + this.resStr($r('app.string.reason_label')) + this.getErrorCodeMsg(ret), buttons: [{ text: $r('app.string.confirm'), color: '#000000' }] });
                      }
                    })
                    .margin(10)
                }
              }
              .padding(20)
            }
            .layoutWeight(1)
            .height('100%')
          }
          .width('100%')
          .height('100%')
        }.tabBar(this.PhaseTabBuilder($r('app.string.placeholder_and_hydration'), 1))
      }
      .barWidth('100%')
      .barHeight(50)
      .onChange((index: number) => {
        this.phaseIndex = index;
      })
    }
    .height('100%')
  }
}
