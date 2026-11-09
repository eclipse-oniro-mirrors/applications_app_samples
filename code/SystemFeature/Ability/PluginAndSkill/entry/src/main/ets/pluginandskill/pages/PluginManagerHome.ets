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

import { common, pluginBundleManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo, fileUri, picker } from '@kit.CoreFileKit';
import Logger from '../../util/Logger';
import {
  BODY_FONT_SIZE,
  BUTTON_HEIGHT,
  CARD_RADIUS,
  CONTENT_MAX_WIDTH,
  HSP_FILE_FILTER,
  ITEM_SPACING,
  PAGE_PADDING,
  SECTION_SPACING,
  SUBTITLE_FONT_SIZE,
  TITLE_FONT_SIZE
} from '../../util/Constant';

@Entry
@Component
struct PluginManagerHome {
  @State private pluginFilePath: string = '';
  @State private pluginBundleName: string = '';
  @State private operationResult: ResourceStr = $r('app.string.operation_ready');
  @State private plugins: pluginBundleManager.PluginBundleInfo[] = [];
  @State private isOperating: boolean = false;

  private showError(error: BusinessError): void {
    this.operationResult = `${error.code}: ${error.message}`;
    Logger.error('Plugin operation failed: ' + JSON.stringify(error));
  }

  private async refreshPlugins(): Promise<void> {
    this.plugins = await pluginBundleManager.getAllLocalPluginInfoForSelf();
  }

  private async selectPlugin(): Promise<void> {
    this.isOperating = true;
    try {
      const context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
      const options: picker.DocumentSelectOptions = new picker.DocumentSelectOptions();
      options.maxSelectNumber = 1;
      options.fileSuffixFilters = [HSP_FILE_FILTER];
      const documentPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker(context);
      const selectedUris: string[] = await documentPicker.select(options);
      if (selectedUris.length === 0) {
        return;
      }
      const selectedUri: string = selectedUris[0];
      let sourceFile: fileIo.File | undefined = undefined;
      try {
        sourceFile = fileIo.openSync(selectedUri, fileIo.OpenMode.READ_ONLY);
        const sandboxPath: string = `${context.cacheDir}/${new fileUri.FileUri(selectedUri).name}`;
        fileIo.copyFileSync(sourceFile.fd, sandboxPath);
        this.pluginFilePath = sandboxPath;
        this.operationResult = $r('app.string.select_success');
      } finally {
        if (sourceFile !== undefined) {
          fileIo.closeSync(sourceFile.fd);
        }
      }
    } catch (error) {
      this.showError(error as BusinessError);
    } finally {
      this.isOperating = false;
    }
  }

  private async installPlugin(): Promise<void> {
    const pluginFilePath: string = this.pluginFilePath.trim();
    if (!pluginFilePath) {
      this.operationResult = $r('app.string.path_required');
      return;
    }
    this.isOperating = true;
    try {
      await pluginBundleManager.installLocalPlugin([pluginFilePath]);
      this.operationResult = $r('app.string.install_success');
      await this.refreshPlugins();
    } catch (error) {
      this.showError(error as BusinessError);
    } finally {
      this.isOperating = false;
    }
  }

  private async uninstallPlugin(): Promise<void> {
    const pluginBundleName: string = this.pluginBundleName.trim();
    if (!pluginBundleName) {
      this.operationResult = $r('app.string.bundle_required');
      return;
    }
    this.isOperating = true;
    try {
      await pluginBundleManager.uninstallLocalPlugin(pluginBundleName);
      this.operationResult = $r('app.string.uninstall_success');
      await this.refreshPlugins();
    } catch (error) {
      this.showError(error as BusinessError);
    } finally {
      this.isOperating = false;
    }
  }

  private async queryPlugins(): Promise<void> {
    this.isOperating = true;
    try {
      await this.refreshPlugins();
      this.operationResult = $r('app.string.query_success');
    } catch (error) {
      this.showError(error as BusinessError);
    } finally {
      this.isOperating = false;
    }
  }

  build(): void {
    Scroll() {
      Column({ space: SECTION_SPACING }) {
        Text($r('app.string.page_title'))
          .fontSize(TITLE_FONT_SIZE)
          .fontWeight(FontWeight.Bold)
        Text($r('app.string.page_description'))
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))

        Text(this.pluginFilePath.length > 0 ? this.pluginFilePath : $r('app.string.plugin_path_empty'))
          .width('100%')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.secondary_text'))
        Button($r('app.string.select_plugin_button'))
          .width('100%')
          .height(BUTTON_HEIGHT)
          .enabled(!this.isOperating)
          .onClick(() => {
            this.selectPlugin();
          })
        Button($r('app.string.install_button'))
          .width('100%')
          .height(BUTTON_HEIGHT)
          .enabled(!this.isOperating)
          .onClick(() => {
            this.installPlugin();
          })

        TextInput({
          placeholder: $r('app.string.plugin_bundle_placeholder'),
          text: this.pluginBundleName
        })
          .width('100%')
          .enabled(!this.isOperating)
          .onChange((value: string) => {
            this.pluginBundleName = value;
          })
        Button($r('app.string.uninstall_button'))
          .width('100%')
          .height(BUTTON_HEIGHT)
          .enabled(!this.isOperating)
          .onClick(() => {
            this.uninstallPlugin();
          })

        Button($r('app.string.query_button'))
          .width('100%')
          .height(BUTTON_HEIGHT)
          .enabled(!this.isOperating)
          .onClick(() => {
            this.queryPlugins();
          })
        Text(this.operationResult)
          .width('100%')
          .fontSize(BODY_FONT_SIZE)
          .fontColor($r('app.color.result_text'))

        Text($r('app.string.installed_plugins_title'))
          .fontSize(SUBTITLE_FONT_SIZE)
          .fontWeight(FontWeight.Medium)
        if (this.plugins.length === 0) {
          Text($r('app.string.no_plugins'))
            .fontSize(BODY_FONT_SIZE)
            .fontColor($r('app.color.secondary_text'))
        } else {
          ForEach(this.plugins, (plugin: pluginBundleManager.PluginBundleInfo) => {
            Column({ space: ITEM_SPACING }) {
              Text(plugin.label)
                .fontSize(SUBTITLE_FONT_SIZE)
                .fontWeight(FontWeight.Medium)
              Text(plugin.pluginBundleName)
                .fontSize(BODY_FONT_SIZE)
              Text(`${plugin.versionName} (${plugin.versionCode})`)
                .fontSize(BODY_FONT_SIZE)
              Text($r('app.string.modules_label'))
                .fontSize(BODY_FONT_SIZE)
                .fontWeight(FontWeight.Medium)
              ForEach(plugin.pluginModuleInfos, (moduleInfo: pluginBundleManager.PluginModuleInfo) => {
                Column({ space: ITEM_SPACING }) {
                  Text(moduleInfo.moduleName)
                    .fontSize(BODY_FONT_SIZE)
                    .fontWeight(FontWeight.Medium)
                  Text(moduleInfo.description)
                    .fontSize(BODY_FONT_SIZE)
                    .fontColor($r('app.color.secondary_text'))
                }
                .width('100%')
                .alignItems(HorizontalAlign.Start)
              }, (moduleInfo: pluginBundleManager.PluginModuleInfo) => moduleInfo.moduleName)
            }
            .width('100%')
            .alignItems(HorizontalAlign.Start)
            .padding(PAGE_PADDING)
            .backgroundColor($r('app.color.card_background'))
            .borderRadius(CARD_RADIUS)
          }, (plugin: pluginBundleManager.PluginBundleInfo) => plugin.pluginBundleName)
        }
      }
      .width('100%')
      .constraintSize({ maxWidth: CONTENT_MAX_WIDTH })
      .alignItems(HorizontalAlign.Start)
      .padding(PAGE_PADDING)
    }
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
    .backgroundColor($r('app.color.page_background'))
  }
}
