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

import { common } from '@kit.AbilityKit';
import { PromptAction, UIContext } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo as fs, picker } from '@kit.CoreFileKit';
import { image } from '@kit.ImageKit';

import testNapi from 'libcomm.so';
import { Logger } from '../common/Logger';

@Entry
@Component
struct Index {
  // Detach polling interval in milliseconds. UIAbility polls isObjectAlive at
  // this cadence to detect client proxy destruction and self-terminate.
  static readonly DETACH_POLL_INTERVAL_MS: number = 1000;
  // Snapshot scale factor passed to getComponentSnapshot.
  static readonly SNAPSHOT_SCALE: number = 2;
  // PNG packing quality (0-100).
  static readonly PNG_QUALITY: number = 100;
  // Max number of files selectable in the picker.
  static readonly MAX_SELECT_NUMBER: number = 1;
  // Sentinel value for "no timer scheduled".
  static readonly NO_TIMER: number = -1;
  // Sentinel value for empty edit state / success return.
  static readonly EMPTY_EDIT_STATE: number = 0;
  // OLE object cache path prefix used by NativeOnDoEdit; must match the server.
  static readonly TEMP_CACHE_PREFIX: string = '/data/storage/el2/base/cache/temp_';
  // Default file name proposed by the save picker.
  static readonly DEFAULT_NEW_FILE_NAME: string = 'new_file.aaa';
  // Picker filter label for the .aaa format.
  static readonly AAA_FILE_FILTER: string = 'AAA format file|.aaa';
  // Toolbar height in pixels; the RichEditor fills the remaining vertical space.
  static readonly TOOLBAR_HEIGHT_PX: number = 89;
  // Standard button text color used across dialogs.
  static readonly BUTTON_TEXT_COLOR: string = '#000000';
  // Toolbar background color.
  static readonly TOOLBAR_BG_COLOR: string = '#F5F5F5';
  // Default button margin in pixels.
  static readonly BUTTON_MARGIN: number = 5;

  private currentUri?: string;
  private context?: common.UIAbilityContext;
  private promptAction: PromptAction = this.getUIContext().getPromptAction();
  private controller: RichEditorController = new RichEditorController();
  @State isContentEmbed: boolean = false;
  // Original file path of a linking document, provided by server NativeOnDoEdit
  // via GetNativeFilePath and passed through Want. UIAbility writes the edited
  // result back to this file on save; otherwise only the temp_{ole_id}.aaa
  // cache is updated and the client sees stale content. Empty for embedded docs.
  private originalFilePath: string = '';
  private localStorage = this.getUIContext().getSharedLocalStorage() as LocalStorage;
  private ole_id: string = '';
  // When the client destroys its proxy, the server OE object detaches
  // (RegisterOnObjectDetachFunc removes ole_id from g_objectByKey). UIAbility
  // polls isObjectAlive at this cadence and self-terminates on detach, binding
  // UIAbility lifetime to the OE object. Otherwise the server UIAbility lingers
  // after the client closes its proxy and pins the server process.
  private detachTimerId: number = Index.NO_TIMER;

  async eventError(title: Resource): Promise<void> {
    this.promptAction.showDialog({
      title: title,
      buttons: [
        {
          text: $r('app.string.button_ok'),
          color: Index.BUTTON_TEXT_COLOR
        }
      ]
    });
  }

  /** Drives the extension's save flow through the NAPI bridge and shows the
   *  result dialog locally. libcomm.so is the NAPI module imported by this
   *  UIAbility; it links libentry.so (the ContentEmbed native-extension .so)
   *  via DT_NEEDED, so the NAPI wrappers run against the same
   *  g_objectHandleMap that the extension callbacks populate. */
  invokeNapiSave(): void {
    const code: number = testNapi.save(this.ole_id);
    Logger.info('NAPI save returned: %{public}d', code);
    if (code === Index.EMPTY_EDIT_STATE) {
      this.promptAction.showDialog({
        title: $r('app.string.dialog_save_success'),
        buttons: [{ text: $r('app.string.button_ok'), color: Index.BUTTON_TEXT_COLOR }]
      });
    } else {
      this.promptAction.showDialog({
        title: $r('app.string.dialog_save_failed'),
        message: $r('app.string.dialog_error_code', code),
        buttons: [{ text: $r('app.string.button_ok'), color: Index.BUTTON_TEXT_COLOR }]
      });
    }
  }

  aboutToDisappear(): void {
    if (this.detachTimerId !== Index.NO_TIMER) {
      clearInterval(this.detachTimerId);
      this.detachTimerId = Index.NO_TIMER;
    }
    if (this.isContentEmbed) {
      // Notify the extension that editing has stopped. libcomm.so (NAPI) links
      // libentry.so (ContentEmbed extension .so), so this runs against the
      // same g_objectHandleMap the extension callbacks use.
      const code: number = testNapi.stop(this.ole_id);
      Logger.info('NAPI stop returned: %{public}d', code);
    }
  }

  async aboutToAppear(): Promise<void> {
    // Get the context.
    this.ole_id = this.localStorage.get<string>('ole_id') ?? '';
    this.context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    if (this.context) {
      // Determine whether this is an implicit launch.
      this.currentUri = this.localStorage.get<string>('fileUri');
      this.isContentEmbed = (this.localStorage.get<boolean>('isContentEmbed') as boolean) ?? false;
      this.originalFilePath = this.localStorage.get<string>('originalFilePath') ?? '';
      Logger.info('aboutToAppear ole_id:%{public}s uri:%{public}s embed:%{public}s path:%{private}s',
        this.ole_id, this.currentUri, String(this.isContentEmbed), this.originalFilePath);
      if (this.currentUri) {
        await this.handleOpenFile(this.currentUri);
      } else {
        // Start with an empty editor; save will create the file inline.
        this.controller.deleteSpans();
      }
      if (this.isContentEmbed) {
        // Content-embed mode: poll the OE object liveness and self-terminate on
        // detach. SDK's ContextTerminateAbility uses the Extension token and
        // kills the whole Extension (including other objects' UIAbilities), so
        // it cannot be used to close a single UIAbility. The UIAbility itself
        // must detect detach and call terminateSelf.
        this.detachTimerId = setInterval(() => {
          if (testNapi.isObjectAlive(this.ole_id) === Index.EMPTY_EDIT_STATE) {
            Logger.info('detach detected, terminating self UIAbility ole_id:%{public}s', this.ole_id);
            clearInterval(this.detachTimerId);
            this.detachTimerId = Index.NO_TIMER;
            this.context?.terminateSelf();
          }
        }, Index.DETACH_POLL_INTERVAL_MS);
      }
    } else {
      Logger.error('context is undefined.');
    }
  }

  /** Reads the .aaa file's text and loads it into the RichEditor.
   *  On any read error falls back to an empty editor so the save path can still
   *  create the file. The .aaa format is plain UTF-8 text (no zip). */
  async handleOpenFile(fileUri: string): Promise<void> {
    Logger.info('handleOpenFile fileUri: %{public}s', fileUri);
    let file: fs.File | undefined;
    try {
      file = fs.openSync(fileUri, fs.OpenMode.READ_ONLY);
      const text: string = fs.readTextSync(file.path);
      this.controller.deleteSpans();
      this.controller.addTextSpan(text);
    } catch (error) {
      Logger.error('handleOpenFile read failed: %{public}s', JSON.stringify(error));
      // Fall back to an empty editor so save can still create the file.
      this.controller.deleteSpans();
    } finally {
      if (file) {
        fs.closeSync(file);
      }
    }
  }

  /** Collects plain text from all text spans in the editor. Image spans are
   *  skipped (their .value is not a string) so a pasted image never leaks
   *  'undefined' into the saved text. RichEditorTextSpanResult is a global
   *  ambient type (declared in ets/component/rich_editor.d.ts), so it is
   *  referenced by name without an import. */
  private collectEditorText(): string {
    const spans: RichEditorSpan[] = this.controller.getSpans();
    const parts: string[] = [];
    for (const span of spans) {
      const textSpan: RichEditorTextSpanResult = span as RichEditorTextSpanResult;
      const v: string | Resource = textSpan.value;
      if (typeof v === 'string') {
        parts.push(v);
      }
    }
    return parts.join('');
  }

  /** Writes the editor's plain text to this.currentUri as a .aaa file, then
   *  (in content-embed mode) snapshots the editor and invokes the NAPI save
   *  bridge so the client receives the OnUpdate notification. */
  async handleSaveFile(): Promise<void> {
    const text: string = this.collectEditorText();
    Logger.info('handleSaveFile target: %{public}s', this.currentUri ?? '');
    let file: fs.File | undefined;
    try {
      file = fs.openSync(this.currentUri, fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC | fs.OpenMode.CREATE);
      fs.writeSync(file.fd, text);
    } catch (error) {
      Logger.error('handleSaveFile write failed: %{public}s', JSON.stringify(error));
      this.promptAction.showDialog({
        title: $r('app.string.dialog_save_failed'),
        message: $r('app.string.dialog_write_target_failed'),
        buttons: [{ text: $r('app.string.button_ok'), color: Index.BUTTON_TEXT_COLOR }]
      });
      return;
    } finally {
      if (file) {
        fs.closeSync(file);
      }
    }
    if (this.isContentEmbed) {
      // Decouple the snapshot from the save. A snapshot failure must NOT be
      // reported as "write target file failed" -- the .aaa was already written.
      // getSnapshot swallows its own errors and returns undefined.
      await this.getSnapshot();
      this.invokeNapiSave();
    }
  }

  /** Save orchestrator. Three branches, matching the prior Web version:
   *   - standalone (no currentUri, not embed): launch picker to pick a save target
   *   - content-embed: write to originalFilePath (linking doc) or temp cache, then
   *     snapshot + NAPI save to notify the client
   *   - already-currentUri standalone: just write through */
  async save(): Promise<void> {
    if (!this.currentUri && !this.isContentEmbed) {
      const documentSaveOptions: picker.DocumentSaveOptions = new picker.DocumentSaveOptions();
      documentSaveOptions.newFileNames = [Index.DEFAULT_NEW_FILE_NAME];
      documentSaveOptions.fileSuffixChoices = [Index.AAA_FILE_FILTER];
      const documentPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker();
      documentPicker.save(documentSaveOptions).then((uris: Array<string>) => {
        Logger.info('documentViewPicker.save uris: %{public}s', uris.toString());
        if (uris && uris.length > 0) {
          this.currentUri = uris[0];
          this.handleSaveFile();
        }
      }).catch((err: BusinessError) => {
        Logger.error('documentViewPicker.save failed code: %{public}d msg: %{public}s', err.code, err.message);
      });
    } else if (this.isContentEmbed) {
      // Linking document: write the edited result back to the original linked
      // file, not the temp_{ole_id}.aaa cache. Otherwise the client reopens
      // the linked file and sees stale content. originalFilePath comes from
      // server NativeOnDoEdit via GetNativeFilePath and is passed through Want;
      // empty for embedded documents, which keep the original temp path.
      if (this.originalFilePath) {
        this.currentUri = this.originalFilePath;
      } else {
        this.currentUri = `${Index.TEMP_CACHE_PREFIX}${this.ole_id}.aaa`;
      }
      this.handleSaveFile();
    } else {
      // Compose the .aaa into the existing currentUri.
      this.handleSaveFile();
    }
  }

  /** OLE-side save (toolbar button enabled only in content-embed mode). Behaves
   *  identically to handleSaveFile: writes plain text to currentUri, then
   *  snapshots + invokes the NAPI save bridge. */
  async handleOLESaveFile(): Promise<void> {
    await this.handleSaveFile();
  }

  /** Save As: launch picker to choose a new target, write plain text there.
   *  No snapshot / NAPI callback (the user is exporting a copy, not updating
   *  the embedded object). */
  async handSaveAs(): Promise<void> {
    const documentSaveOptions: picker.DocumentSaveOptions = new picker.DocumentSaveOptions();
    documentSaveOptions.newFileNames = [Index.DEFAULT_NEW_FILE_NAME];
    documentSaveOptions.fileSuffixChoices = [Index.AAA_FILE_FILTER];
    const documentPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker();
    documentPicker.save(documentSaveOptions).then((uris: Array<string>) => {
      Logger.info('handSaveAs uris: %{public}s', uris.toString());
      if (uris && uris.length > 0) {
        const text: string = this.collectEditorText();
        let file: fs.File | undefined;
        try {
          file = fs.openSync(uris[0], fs.OpenMode.WRITE_ONLY | fs.OpenMode.TRUNC | fs.OpenMode.CREATE);
          fs.writeSync(file.fd, text);
        } catch (error) {
          Logger.error('handSaveAs write failed: %{public}s', JSON.stringify(error));
          this.promptAction.showDialog({
            title: $r('app.string.dialog_save_failed'),
            message: $r('app.string.dialog_write_target_failed'),
            buttons: [{ text: $r('app.string.button_ok'), color: Index.BUTTON_TEXT_COLOR }]
          });
          return;
        } finally {
          if (file) {
            fs.closeSync(file);
          }
        }
        this.promptAction.showDialog({
          title: $r('app.string.dialog_save_success'),
          buttons: [{ text: $r('app.string.button_ok'), color: Index.BUTTON_TEXT_COLOR }]
        });
      }
    }).catch((err: BusinessError) => {
      Logger.error('handSaveAs picker failed code: %{public}d msg: %{public}s', err.code, err.message);
    });
  }

  /** Snapshot the RichEditor to a PNG. The native NativeOnGetSnapshot reads
   *  temp/web_snapshot_{ole_id}.png, so the id and the path must stay stable
   *  across the Web→RichEditor migration. */
  async getSnapshot(): Promise<string | undefined> {
    const uiContext: UIContext = this.getUIContext();
    Logger.info('start getSnapshot');
    const pixmap: image.PixelMap | undefined = await uiContext?.getComponentSnapshot()
      .get('oleEditor', { scale: Index.SNAPSHOT_SCALE, waitUntilRenderFinished: true });
    const path: string | undefined = this.context?.tempDir;
    const name: string = `web_snapshot_${this.ole_id}.png`;
    const filePath: string = `${path}/${name}`;
    const packOpts: image.PackingOption = { format: 'image/png', quality: Index.PNG_QUALITY };
    Logger.info('filePath: %{public}s', JSON.stringify(filePath));
    const file: fs.File = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    const imagePacker: image.ImagePacker = image.createImagePacker();
    // Keep the snapshot step from rejecting the whole save flow. The previous
    // structure let an exception from packToFile/release/closeSync bubble up
    // into handleSaveFile's copyFile .catch, which then showed the misleading
    // "write target file failed" dialog even though the .aaa had been written.
    try {
      await imagePacker.packToFile(pixmap, file.fd, packOpts);
    } catch (e) {
      const err: BusinessError = e as BusinessError;
      Logger.error('getSnapshot packToFile failed code: %{public}d msg: %{public}s', err.code, err.message);
      return undefined;
    } finally {
      try { imagePacker.release(); } catch (e) {
        Logger.error('getSnapshot imagePacker.release threw: %{public}s', JSON.stringify(e));
      }
      try { fs.closeSync(file.fd); } catch (e) {
        Logger.error('getSnapshot closeSync threw: %{public}s', JSON.stringify(e));
      }
    }
    return filePath;
  }

  /** Toolbar "Open": pick a .aaa file and load it into the editor. */
  async open(): Promise<void> {
    const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
    options.selectMode = picker.DocumentSelectMode.FILE;
    options.fileSuffixFilters = [Index.AAA_FILE_FILTER];
    options.maxSelectNumber = Index.MAX_SELECT_NUMBER;
    const documentPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker();
    documentPicker.select(options).then(async (uris: string[]) => {
      if (uris.length > 0) {
        this.currentUri = uris[0];
        await this.handleOpenFile(uris[0]);
      }
    }).catch((err: BusinessError) => {
      Logger.error('open picker failed: %{public}s', JSON.stringify(err));
    });
  }

  build() {
    Column() {
      // Toolbar.
      Row() {
        Button($r('app.string.button_open'))
          .margin(Index.BUTTON_MARGIN)
          .controlSize(ControlSize.SMALL)
          .onClick(() => {
            this.open();
          })
        Button($r('app.string.button_save'))
          .margin(Index.BUTTON_MARGIN)
          .controlSize(ControlSize.SMALL)
          .onClick(() => {
            this.save();
          })
        Button($r('app.string.button_snapshot'))
          .margin(Index.BUTTON_MARGIN)
          .controlSize(ControlSize.SMALL)
          .onClick(() => {
            this.getSnapshot();
          })
        Button($r('app.string.button_save_as'))
          .margin(Index.BUTTON_MARGIN)
          .controlSize(ControlSize.SMALL)
          .onClick(() => {
            this.handSaveAs();
          })
        Button($r('app.string.button_ole_save_as'))
          .margin(Index.BUTTON_MARGIN)
          .controlSize(ControlSize.SMALL)
          .enabled(this.isContentEmbed === true)
          .onClick(() => {
            this.handleOLESaveFile();
          })
      }.width('100%').padding(Index.BUTTON_MARGIN).backgroundColor(Index.TOOLBAR_BG_COLOR)
      RichEditor({ controller: this.controller })
        .width('100%')
        .height(`calc(100% - ${Index.TOOLBAR_HEIGHT_PX}px)`)
        .id('oleEditor')
    }
    .width('100%')
    .height('100%')
  }
}
