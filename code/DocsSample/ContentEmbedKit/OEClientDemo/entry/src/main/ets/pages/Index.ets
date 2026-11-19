/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import testNapi, { CEProxy } from 'libentry.so';
import { PromptAction, window } from '@kit.ArkUI';
import { BusinessError, emitter, zlib } from '@kit.BasicServicesKit';
import { fileIo as fs, picker } from '@kit.CoreFileKit';
import { common, Want } from '@kit.AbilityKit';
import { fileSelectedEvent, formatSelectedEvent } from '../utils/InnerEvent';
import { FileCard } from '../component/FileCard';
import { CECardViewModel } from '../common/CECardViewModel';
import { tempDirName } from '../common/Common';
import { Logger } from '../common/Logger';
import { getCEErrMsg } from '../common/CEErrorMap';
import { dlpPermission } from '@kit.DataProtectionKit';
import { util } from '@kit.ArkTS';

const CE_ERR_OK = 0;
const CE_ERR_IN_DLP_SANDBOX = 35300008;
const CE_ERR_FILE_OPERATION_FAILED = 35300007;
const UUID_PREFIX_LENGTH = 8;
const MAX_SELECT_NUMBER = 1;
const TOOLBAR_PADDING = 10;
const TOOLBAR_BUTTON_MARGIN = 5;
const SUB_WINDOW_DEFAULT_WIDTH = 1200;
const SUB_WINDOW_DEFAULT_HEIGHT = 900;
const SUB_WINDOW_MIN_WIDTH = 320;
const SUB_WINDOW_MAX_WIDTH = 1600;
const SUB_WINDOW_MIN_HEIGHT = 400;
const SUB_WINDOW_MAX_HEIGHT = 1200;
const SUB_WINDOW_WIDTH_RATIO = 0.9;
const SUB_WINDOW_HEIGHT_RATIO = 0.85;
const INITIAL_FILE_COUNTER = 1;
const OLE_FILE_FILTER = 'OLE format file|.ole';

let fileCounter: number = INITIAL_FILE_COUNTER;

// Page-level storage for shared data.
let localStorage: LocalStorage = new LocalStorage();

@Entry(localStorage)
@Component
struct Index {
  @State fileList: CECardViewModel[] = [];
  private currentUri?: string;
  private tempDir: string = '';
  private context?: common.UIAbilityContext = undefined;
  private promptAction: PromptAction = this.getUIContext().getPromptAction();

  async aboutToAppear(): Promise<void> {
    // [Start content_embed_client_get_context]
    let context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
    testNapi.receiveContext(context);
    // [End content_embed_client_get_context]
    this.context = context;
    // Create temp file directory.
    let uuid: string = util.generateRandomUUID(true).substring(0, UUID_PREFIX_LENGTH);
    this.tempDir = `${this.context?.tempDir}/${uuid}`; // sandbox directory
    try {
      await fs.mkdir(this.tempDir);
      // Create decompression directory.
      const destDir = `${this.tempDir}/${tempDirName}`;
      await fs.mkdir(destDir);
      // Check if launched implicitly.
      this.currentUri = AppStorage.get<string>('fileUri');
      if (this.currentUri) {
        await this.handleOpenFile(this.currentUri);
      }
    } catch (error) {
      Logger.error('Initialize page failed: %{public}s', JSON.stringify(error));
      this.showResult(CE_ERR_FILE_OPERATION_FAILED);
      return;
    }
    // Listen for format selection event (insert file).
    emitter.on(formatSelectedEvent, (res) => {
      if (res.data) {
        const data: Record<string, string> = res.data as Record<string, string>;
        const oeid: string = data.oeid;
        this.handleCreateByOEid(oeid);
      }
    });
    // Listen for file selection event (insert existing file).
    emitter.on(fileSelectedEvent, (res) => {
      if (res.data) {
        const data: Record<string, Object> = res.data as Record<string, Object>;
        const path: string = data.path as string;
        const fileUri: string = data.uri as string;
        const isLinking: boolean = data.isLinking === true;
        this.handleCreateFromLocal(path, fileUri, isLinking);
      }
    });
  }

  aboutToDisappear(): void {
    // Unregister the selection listeners so a page recreate does not
    // double-register (which would create two proxies per user action).
    emitter.off(formatSelectedEvent.eventId);
    emitter.off(fileSelectedEvent.eventId);
    for (const vm of this.fileList) {
      vm.proxy.destroy();
    }
    this.fileList = [];
  }

  private buildSandboxPath(): string {
    const n = fileCounter++;
    return `${this.tempDir}/${tempDirName}/oleObject${n}.bin`;
  }

  private handleCreateByOEid(oeid: string): void {
    const sandboxPath = this.buildSandboxPath();
    const result = testNapi.createByOEid(this.context, oeid, sandboxPath);
    if (result.errCode === CE_ERR_OK) {
      this.addProxyToList(result.data);
    } else {
      this.showResult(result.errCode);
    }
  }

  private handleCreateFromLocal(srcPath: string, fileUri: string, isLinking: boolean): void {
    const sandboxPath = this.buildSandboxPath();
    const result = testNapi.createFromLocal(this.context, srcPath, sandboxPath, fileUri, isLinking);
    if (result.errCode === CE_ERR_OK) {
      this.addProxyToList(result.data);
    } else {
      this.showResult(result.errCode);
    }
  }

  private addProxyToList(proxy: CEProxy): void {
    const vm = new CECardViewModel(proxy);
    proxy.setOnUpdate((p: CEProxy) => {
      p.refresh();
      vm.syncFromProxy();
    });
    proxy.setOnError((p: CEProxy, errCode: number) => {
      Logger.error(`CEProxy onError: ${errCode}`);
      // Teardown on error: destroy the proxy and remove the card so a
      // broken proxy does not linger in the list (spec: ArkTS decides
      // whether to destroy() — here we always do, since the extension is
      // in an error state).
      p.destroy();
      this.fileList = this.fileList.filter(v => v !== vm);
      this.showResult(errCode);
    });
    // Do NOT call refresh() immediately after StartWork. hilog (20261106113814)
    // proves OH_ContentEmbed_Proxy_GetSnapshot returns CE_ERR_PARAM_INVALID
    // (401, "snapshotPath is invalid") when called right after StartWork — the
    // SDK's internal snapshot-path setup is not ready yet, and the server-side
    // SetSnapshot callback has not run. The thumbnail is fetched when the SDK
    // fires OnUpdate (server calls CallbackToOnUpdate after SetSnapshot), which
    // triggers refresh() + syncFromProxy() above. Until then FileCard renders
    // via the snapshotUri fallback (if a .png exists) or the name text.
    vm.syncFromProxy();
    this.fileList = [...this.fileList, vm];
  }

  private isInDlp(): Promise<boolean> {
    return dlpPermission.isInSandbox();
  }

  build() {
    Row() {
      Column() {
        // Toolbar.
        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start }) {
          Button($r('app.string.btn_open_file'))
            .margin(TOOLBAR_BUTTON_MARGIN)
            .onClick(async () => {
              let options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
              options.selectMode = picker.DocumentSelectMode.FILE;
              options.fileSuffixFilters = [OLE_FILE_FILTER];
              options.maxSelectNumber = MAX_SELECT_NUMBER;
              let documentPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker();
              documentPicker.select(options).then(async (uris: string[]) => {
                if (uris.length > 0) {
                  const want: Want = {
                    bundleName: this.context?.abilityInfo.bundleName,
                    moduleName: 'entry',
                    abilityName: 'EntryAbility',
                    uri: uris[0]
                  };
                  this.context?.startAbility(want).then(() => {
                    Logger.info('handle start ability');
                  }).catch((err: BusinessError) => {
                    Logger.error('start ability failed: %{public}s', JSON.stringify(err));
                  });
                }
              }).catch((err: BusinessError) => {
                Logger.error('Invoke documentViewPicker.select failed, code is %{public}d, message is %{public}s',
                  err.code, err.message);
              });
            })
          Button($r('app.string.btn_save_file'))
            .margin(TOOLBAR_BUTTON_MARGIN)
            .onClick(async () => {
              if (!this.currentUri) {
                const documentSaveOptions = new picker.DocumentSaveOptions();
                documentSaveOptions.newFileNames = ['new_file.ole'];
                documentSaveOptions.fileSuffixChoices = [OLE_FILE_FILTER];
                let documentPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker();
                documentPicker.save(documentSaveOptions).then((uris: string[]) => {
                  Logger.info(`documentViewPicker.save to file succeed and uris are: ${JSON.stringify(uris)}`);
                  if (uris && uris.length > 0) {
                    this.currentUri = uris[0];
                    this.handleSaveFile();
                  }
                }).catch((err: BusinessError) => {
                  Logger.error('Invoke documentViewPicker.save failed, code is %{public}d, message is %{public}s',
                    err.code, err.message);
                });
              } else {
                this.handleSaveFile();
              }
            })
          Button($r('app.string.btn_insert_file'))
            .margin(TOOLBAR_BUTTON_MARGIN)
            .onClick(() => {
              this.createSubWindow($r('app.string.title_object'), 'pages/ContentEmbedFormat');
            })
          Button($r('app.string.btn_insert_existing'))
            .margin(TOOLBAR_BUTTON_MARGIN)
            .onClick(async () => {
              if (await this.isInDlp()) {
                this.showResult(CE_ERR_IN_DLP_SANDBOX);
                return;
              }
              this.createSubWindow($r('app.string.title_object'), 'pages/FilePickerTab');
            })
          Button($r('app.string.btn_query_format'))
            .margin(TOOLBAR_BUTTON_MARGIN)
            .onClick(() => {
              this.createSubWindow($r('app.string.title_object'), 'pages/ContentEmbedFormatQuery');
            })
        }
        .width('100%')
        .padding(TOOLBAR_PADDING)
        .backgroundColor($r('app.color.toolbar_background'))
        .borderWidth({ bottom: 1 })
        .borderColor({ bottom: Color.Gray })
        GridRow({ breakpoints: { value: ['600vp', '840vp'], reference: BreakpointsReference.WindowSize } }) {
          ForEach(this.fileList, (item: CECardViewModel) => {
            GridCol({ span: { sm: 6, md: 4, lg: 3 } }) {
              FileCard({
                item: item,
                onRemove: () => {
                  this.fileList = this.fileList.filter(v => v !== item);
                }
              })
            }
          }, (item: CECardViewModel) => item.proxy.getPath())
        }
        .padding(TOOLBAR_PADDING)
        .width('100%')
      }
      .height('100%')
      .width('100%')
    }
    .height('100%')
  }

  createSubWindow(titleRes: Resource, page: string): void {
    const windowStage = AppStorage.get<window.WindowStage>('windowStage');
    if (!windowStage) {
      Logger.error('createSubWindow: windowStage not found (not injected in onWindowStageCreate)');
      return;
    }
    const title = this.context?.resourceManager.getStringSync(titleRes.id) ?? '';
    const options: window.SubWindowOptions = {
      title: title,
      decorEnabled: true,
      isModal: true
    };
    windowStage.createSubWindowWithOptions('subWindow', options)
      .then((windowClass: window.Window) => {
        const mainWindow = windowStage.getMainWindowSync();
        const rect = mainWindow.getWindowProperties().windowRect;
        const subRect = this.getSubWindowRect(rect, SUB_WINDOW_DEFAULT_WIDTH, SUB_WINDOW_DEFAULT_HEIGHT);
        windowClass.setWindowLimits({
          minWidth: SUB_WINDOW_MIN_WIDTH,
          maxWidth: SUB_WINDOW_MAX_WIDTH,
          minHeight: SUB_WINDOW_MIN_HEIGHT,
          maxHeight: SUB_WINDOW_MAX_HEIGHT
        }).catch((err: BusinessError) => {
          Logger.error('setWindowLimits failed: %{public}s', JSON.stringify(err));
        });
        windowClass.resizeAsync(subRect.width, subRect.height).then(() => {
          return windowClass.moveWindowToAsync(subRect.left, subRect.top);
        }).catch((err: BusinessError) => {
          Logger.error('resize/moveWindowTo failed: %{public}s', JSON.stringify(err));
        });
        windowClass.loadContent(page, localStorage).catch((err: BusinessError) => {
          Logger.error('loadContent failed: %{public}s', JSON.stringify(err));
        });
        windowClass.showWindow().catch((err: BusinessError) => {
          Logger.error('showWindow failed: %{public}s', JSON.stringify(err));
        });
      })
      .catch((err: BusinessError) => {
        Logger.error('createSubWindowWithOptions failed: %{public}s', JSON.stringify(err));
      });
  }

  /**
   * Computes the sub-window rect: size is the requested default clamped to a ratio
   * of the parent window and to [MIN, parentSize]; position centers the clamped
   * size inside the parent rect (offset never negative).
   */
  getSubWindowRect(rect: window.Rect, width: number, height: number): window.Rect {
    const targetW = Math.min(Math.round(rect.width * SUB_WINDOW_WIDTH_RATIO), width);
    const targetH = Math.min(Math.round(rect.height * SUB_WINDOW_HEIGHT_RATIO), height);
    const clampedW = Math.min(Math.max(targetW, SUB_WINDOW_MIN_WIDTH), rect.width);
    const clampedH = Math.min(Math.max(targetH, SUB_WINDOW_MIN_HEIGHT), rect.height);
    const offsetX = Math.max((rect.width - clampedW) / 2, 0);
    const offsetY = Math.max((rect.height - clampedH) / 2, 0);
    return {
      left: rect.left + offsetX,
      top: rect.top + offsetY,
      width: clampedW,
      height: clampedH
    }
  }

  async handleOpenFile(fileUri: string): Promise<void> {
    // Open, read the real path, and close inside the first try: the fd must not be
    // used (or closed again) after finally runs.
    let srcPath: string = '';
    try {
      const file: fs.File = fs.openSync(fileUri);
      try {
        srcPath = file.path;
      } finally {
        fs.closeSync(file);
      }
    } catch (error) {
      Logger.error('Read file error: %{public}s', JSON.stringify(error));
      return;
    }
    const tempFileName = 'temp.zip';
    const destPath = `${this.tempDir}/${tempFileName}`;
    try {
      fs.copyFileSync(srcPath, destPath);
    } catch (error) {
      Logger.error('Copy file error: %{public}s', JSON.stringify(error));
      return;
    }
    try {
      const destDir = `${this.tempDir}/${tempDirName}`;
      await zlib.decompressFile(destPath, destDir);
      this.loadJsonData(`${destDir}/data.json`);
    } catch (err) {
      Logger.error('Decompress failed: %{public}s', JSON.stringify(err));
    }
  }

  handleSaveFile(): void {
    // Guard: currentUri is string | undefined; saving requires an opened .ole target.
    const targetUri: string | undefined = this.currentUri;
    if (targetUri === undefined) {
      Logger.error('handleSaveFile: no target uri.');
      return;
    }
    const destDir = `${this.tempDir}/${tempDirName}`;
    if (!this.saveJsonData(`${destDir}/data.json`)) {
      Logger.error('saveJsonData failed.');
      return;
    }
    const tempFileName = 'temp.zip';
    const outPath = `${this.tempDir}/${tempFileName}`;
    let options: zlib.Options = {
      level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
      memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
      strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
    };
    const files: string[] = fs.listFileSync(destDir).map((val: string) => `${destDir}/${val}`);
    zlib.compressFiles(files, outPath, options).then(() => {
      Logger.info('compressFiles success.');
      let input: fs.File | undefined = undefined;
      let output: fs.File | undefined = undefined;
      try {
        input = fs.openSync(outPath, fs.OpenMode.READ_ONLY);
        // TRUNC: a re-saved archive may be smaller than the previous one; without
        // truncation stale trailing bytes would corrupt the restored .ole file.
        output = fs.openSync(targetUri, fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC);
        // Sync copy: the fds in finally are closed only after the copy finishes.
        fs.copyFileSync(input.fd, output.fd);
        Logger.info('copy compress file success.');
        this.showResult(CE_ERR_OK);
      } catch (error) {
        Logger.error('copy compress file failed: %{public}s', JSON.stringify(error));
      } finally {
        if (input) {
          fs.closeSync(input);
        }
        if (output) {
          fs.closeSync(output);
        }
      }
    }).catch((err: BusinessError) => {
      Logger.error('compressFiles failed: %{public}s', JSON.stringify(err));
    });
  }

  /**
   * Persists card metadata to data.json ({ name, path, snapshotPath } with relative
   * basenames so the archive stays portable); returns false when the write fails.
   */
  saveJsonData(filePath: string): boolean {
    // data.json format: { name, path, snapshotPath } — NO id (dropped, no backward compat)
    interface Output {
      name: string,
      path: string,        // relative basename (round-trips with loadJsonData)
      snapshotPath: string
    }
    let jsonArray: Output[] = this.fileList.map((vm: CECardViewModel) => {
      const absPath: string = vm.proxy.getPath();
      const parts: string[] = absPath.split('/');
      const basename: string = parts.length > 0 ? parts[parts.length - 1] : absPath;
      const snapAbs: string = vm.proxy.getSnapshotPath();
      const snapParts: string[] = snapAbs.split('/');
      const snapBase: string = snapParts.length > 0 ? snapParts[snapParts.length - 1] : snapAbs;
      let tmp: Output = {
        name: vm.proxy.getName(),
        path: basename,
        snapshotPath: snapBase
      };
      return tmp;
    });
    const jsonData = JSON.stringify(jsonArray);
    let file: fs.File | undefined = undefined;
    try {
      file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      fs.writeSync(file.fd, jsonData);
      return true;
    } catch (error) {
      Logger.error('write file failed: %{public}s', JSON.stringify(error));
      return false;
    } finally {
      if (file) {
        fs.closeSync(file);
      }
    }
  }

  /**
   * Restores cards from data.json written by saveJsonData: each entry becomes a
   * dormant proxy (createDormant) with no live extension; double-click reactivates.
   */
  loadJsonData(filePath: string): void {
    try {
      // data.json is absent when the .ole file was saved before any card existed;
      // that is "nothing to restore", not an error (and must not be created here).
      if (!fs.accessSync(filePath)) {
        Logger.info('data.json not found, skip restore.');
        return;
      }
      const jsonStr = fs.readTextSync(filePath);
      interface JsonEntry {
        name: string,
        path: string,
        snapshotPath: string
      }
      const jsonArray: JsonEntry[] = JSON.parse(jsonStr) as JsonEntry[];
      const destDir = `${this.tempDir}/${tempDirName}`;
      const newVms: CECardViewModel[] = [];
      jsonArray.forEach((item: JsonEntry) => {
        const name: string = item.name;
        const relPath: string = item.path;
        const relSnapshot: string = item.snapshotPath;
        const absPath = `${destDir}/${relPath}`;
        const result = testNapi.createDormant(this.context, name, absPath, relSnapshot);
        if (result.errCode === CE_ERR_OK) {
          const proxy: CEProxy = result.data;
          const vm = new CECardViewModel(proxy);
          proxy.setOnUpdate((p: CEProxy) => {
            p.refresh();
            vm.syncFromProxy();
          });
          proxy.setOnError((p: CEProxy, errCode: number) => {
            Logger.error(`CEProxy onError: ${errCode}`);
            p.destroy();
            this.fileList = this.fileList.filter(v => v !== vm);
            this.showResult(errCode);
          });
          newVms.push(vm);
        }
      });
      this.fileList = [...this.fileList, ...newVms];
      Logger.info('loadJsonData count: %{public}d', this.fileList.length);
    } catch (e) {
      Logger.error('loadJsonData failed: %{public}s', JSON.stringify(e));
    }
  }

  showResult(result: number): void {
    if (result === CE_ERR_OK) {
      this.promptAction.showDialog({
        title: $r('app.string.title_success'),
        buttons: [
          { text: $r('app.string.btn_ok'), color: $r('app.color.button_text_color') }
        ]
      })
    } else {
      this.promptAction.showDialog({
        title: $r('app.string.title_failed'),
        message: getCEErrMsg(result, this.context),
        buttons: [
          { text: $r('app.string.btn_ok'), color: $r('app.color.button_text_color') }
        ]
      })
    }
  }
}
