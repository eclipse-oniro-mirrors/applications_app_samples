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
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../../utils/Logger';
import { ResultText } from '../../utils/ResultText';
import { SendablePreferencesHelper } from '../SendablePreferencesHelper';

@Entry
@Component
struct SendablePreferencesHome {
  @State private result: ResourceStr = $r('app.string.initial_result');
  private helper: SendablePreferencesHelper | null = null;

  aboutToAppear(): void {
    const context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
    this.helper = new SendablePreferencesHelper(context, (message: string): void => {
      this.result = message;
    });
  }

  aboutToDisappear(): void {
    if (this.helper !== null) {
      this.helper.release();
      this.helper = null;
    }
  }

  @Builder
  sectionTitle(title: Resource): void {
    Text(title)
      .fontSize(18)
      .fontWeight(FontWeight.Medium)
      .fontColor($r('app.color.primary_text'))
      .width('100%')
      .margin({ top: 8 })
  }

  @Builder
  actionButton(label: Resource, action: () => void): void {
    Button(label)
      .width('100%')
      .height(44)
      .fontSize(14)
      .onClick(action)
  }

  @Builder
  buttonRow(firstLabel: Resource, firstAction: () => void, secondLabel: Resource, secondAction: () => void): void {
    Row({ space: 8 }) {
      Button(firstLabel)
        .layoutWeight(1)
        .height(44)
        .fontSize(13)
        .onClick(firstAction)
      Button(secondLabel)
        .layoutWeight(1)
        .height(44)
        .fontSize(13)
        .onClick(secondAction)
    }
    .width('100%')
  }

  build(): void {
    Column({ space: 10 }) {
      Text($r('app.string.preferences_title'))
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.primary_text'))
        .id('preferences_page_title')
      Text($r('app.string.preferences_description'))
        .fontSize(14)
        .fontColor($r('app.color.secondary_text'))
      Scroll() {
        Column({ space: 8 }) {
          this.sectionTitle($r('app.string.section_instance'))
          this.buttonRow($r('app.string.initialize_async'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().initialize()),
            $r('app.string.initialize_sync'),
            (): void => this.runSync((): string => this.getHelper().initializeSync()))
          this.actionButton($r('app.string.show_limits'),
            (): void => this.runSync((): string => this.getHelper().getLimits()))

          this.sectionTitle($r('app.string.section_write_read'))
          this.buttonRow($r('app.string.put_async'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().putValue()),
            $r('app.string.put_sync'),
            (): void => this.runSync((): string => this.getHelper().putValueSync()))
          this.buttonRow($r('app.string.get_async'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().getValue()),
            $r('app.string.get_sync'),
            (): void => this.runSync((): string => this.getHelper().getValueSync()))
          this.buttonRow($r('app.string.get_all_async'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().getAllValues()),
            $r('app.string.get_all_sync'),
            (): void => this.runSync((): string => this.getHelper().getAllValuesSync()))
          this.buttonRow($r('app.string.has_async'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().hasValue()),
            $r('app.string.has_sync'),
            (): void => this.runSync((): string => this.getHelper().hasValueSync()))

          this.sectionTitle($r('app.string.section_persistence'))
          this.buttonRow($r('app.string.delete_async'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().deleteValue()),
            $r('app.string.delete_sync'),
            (): void => this.runSync((): string => this.getHelper().deleteValueSync()))
          this.buttonRow($r('app.string.flush_async'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().flushValues()),
            $r('app.string.flush_sync'),
            (): void => this.runSync((): string => this.getHelper().flushValuesSync()))
          this.buttonRow($r('app.string.clear_async'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().clearValues()),
            $r('app.string.clear_sync'),
            (): void => this.runSync((): string => this.getHelper().clearValuesSync()))

          this.sectionTitle($r('app.string.section_events'))
          this.buttonRow($r('app.string.subscribe_change'),
            (): void => this.runSync((): string => this.getHelper().subscribeChange()),
            $r('app.string.unsubscribe_change'),
            (): void => this.runSync((): string => this.getHelper().unsubscribeChange()))
          this.buttonRow($r('app.string.subscribe_multi_process'),
            (): void => this.runSync((): string => this.getHelper().subscribeMultiProcessChange()),
            $r('app.string.unsubscribe_multi_process'),
            (): void => this.runSync((): string => this.getHelper().unsubscribeMultiProcessChange()))
          this.buttonRow($r('app.string.subscribe_data_change'),
            (): void => this.runSync((): string => this.getHelper().subscribeDataChange()),
            $r('app.string.unsubscribe_data_change'),
            (): void => this.runSync((): string => this.getHelper().unsubscribeDataChange()))

          this.sectionTitle($r('app.string.section_multi_key'))
          this.buttonRow($r('app.string.put_multiple_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().putMultiple(['key_a', 'key_b', 'key_c'], ['val_a', 'val_b', 'val_c'])),
            $r('app.string.put_multiple_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().putMultipleSync(['key_d', 'key_e'], ['val_d', 'val_e'])))
          this.buttonRow($r('app.string.get_multiple_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().getMultiple(['key_a', 'key_b', 'key_c'])),
            $r('app.string.get_multiple_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().getMultipleSync(['key_a', 'key_b'])))
          this.buttonRow($r('app.string.delete_multiple'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().deleteMultiple(['key_a', 'key_b'])),
            $r('app.string.has_multiple'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().hasMultiple(['key_a', 'key_c'])))

          this.sectionTitle($r('app.string.section_typed'))
          this.buttonRow($r('app.string.put_number_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().putNumber('num_key', 42)),
            $r('app.string.get_number_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().getNumber('num_key', 0)))
          this.buttonRow($r('app.string.put_number_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().putNumberSync('num_sync', 99)),
            $r('app.string.get_number_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().getNumberSync('num_sync', 0)))
          this.buttonRow($r('app.string.put_boolean_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().putBoolean('bool_key', true)),
            $r('app.string.get_boolean_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().getBoolean('bool_key', false)))
          this.buttonRow($r('app.string.put_boolean_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().putBooleanSync('bool_sync', false)),
            $r('app.string.get_boolean_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().getBooleanSync('bool_sync', true)))
          this.buttonRow($r('app.string.put_string_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().putString('str_key', 'hello sendable')),
            $r('app.string.get_string_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().getString('str_key', 'default')))
          this.buttonRow($r('app.string.put_string_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().putStringSync('str_sync', 'sync value')),
            $r('app.string.get_string_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().getStringSync('str_sync', 'default')))
          this.buttonRow($r('app.string.put_object_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().putObject('obj_key', '{"name":"test"}')),
            $r('app.string.get_object_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().getObject('obj_key', '{}')))
          this.buttonRow($r('app.string.put_object_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().putObjectSync('obj_sync', '{"sync":true}')),
            $r('app.string.get_object_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().getObjectSync('obj_sync', '{}')))

          this.sectionTitle($r('app.string.section_prefix'))
          this.buttonRow($r('app.string.get_keys_by_prefix_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().getKeysByPrefix('key_')),
            $r('app.string.get_keys_by_prefix_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().getKeysByPrefixSync('key_')))
          this.buttonRow($r('app.string.count_by_prefix_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().countByPrefix('key_')),
            $r('app.string.count_by_prefix_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().countByPrefixSync('num_')))
          this.buttonRow($r('app.string.delete_by_prefix_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().deleteByPrefix('str_')),
            $r('app.string.delete_by_prefix_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().deleteByPrefixSync('obj_')))

          this.sectionTitle($r('app.string.section_version'))
          this.buttonRow($r('app.string.get_version_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().getStoreVersion()),
            $r('app.string.get_version_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().getStoreVersionSync()))
          this.buttonRow($r('app.string.set_version_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().setStoreVersion(3)),
            $r('app.string.set_version_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().setStoreVersionSync(2)))
          this.buttonRow($r('app.string.get_store_info_async'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().getStoreInfo()),
            $r('app.string.get_store_info_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().getStoreInfoSync()))

          this.sectionTitle($r('app.string.section_statistics'))
          this.actionButton($r('app.string.show_statistics'),
            (): void => this.runSync((): string => this.getHelper().getStatistics()))
          this.buttonRow($r('app.string.reset_statistics'),
            (): void => this.runSync((): string => this.getHelper().resetStatistics()),
            $r('app.string.reinitialize_async'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().reinitialize()))
          this.buttonRow($r('app.string.reinitialize_sync'),
            (): void => this.runSync((): string => this.getHelper().reinitializeSync()),
            $r('app.string.check_initialized'),
            (): void => this.runSync((): string => ResultText.ofArgs($r('app.string.result_page_prefs_initialized'),
              [String(this.getHelper().isInitialized())], `isInitialized=${this.getHelper().isInitialized()}`)))

          this.sectionTitle($r('app.string.section_cache'))
          this.buttonRow($r('app.string.remove_cache_async'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().removeFromCache()),
            $r('app.string.remove_cache_sync'),
            (): void => this.runSync((): string => this.getHelper().removeFromCacheSync()))
          this.actionButton($r('app.string.delete_preferences'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().deleteStore()))
        }
        .width('100%')
      }
      .layoutWeight(1)
      .width('100%')
      .align(Alignment.Top)
      Text($r('app.string.result_title'))
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .width('100%')
      Scroll() {
        Text(this.result)
          .fontSize(13)
          .fontColor($r('app.color.primary_text'))
          .width('100%')
      }
      .height(110)
      .width('100%')
      .padding(12)
      .backgroundColor($r('app.color.result_background'))
      .borderRadius(8)
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor($r('app.color.page_background'))
  }

  private getHelper(): SendablePreferencesHelper {
    if (this.helper === null) {
      throw new Error('Preferences page is not ready');
    }
    return this.helper;
  }

  private runAsync(action: () => Promise<string>): void {
    action().then((message: string): void => {
      this.result = message;
    }).catch((error: BusinessError): void => {
      this.showError(error);
    });
  }

  private runSync(action: () => string): void {
    try {
      this.result = action();
    } catch (error) {
      this.showError(error as BusinessError);
    }
  }

  private showError(error: BusinessError): void {
    const message = `${error.name}: ${error.message}; code=${error.code}`;
    this.result = message;
    Logger.error(message);
  }
}
