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

export class VCardConstants {
  public static readonly READ_CONTACTS: string = 'ohos.permission.READ_CONTACTS';
  public static readonly WRITE_CONTACTS: string = 'ohos.permission.WRITE_CONTACTS';
  public static readonly VCARD_SYSCAP: string = 'SystemCapability.Telephony.CoreService';
  public static readonly CHARSET_UTF8: string = 'UTF-8';
  public static readonly CHARSET_GBK: string = 'GBK';
  public static readonly DEFAULT_HISTORY_LIMIT: number = 20;
  public static readonly HISTORY_LIMIT_OPTIONS: number[] = [5, 10, 20, 50];
  public static readonly PREVIEW_CARD_LIMIT: number = 20;
  public static readonly PREVIEW_LINE_LIMIT: number = 24;
  public static readonly MAX_FILE_BYTES: number = 2 * 1024 * 1024;
  public static readonly VCARD_DIR: string = 'vcard';
  public static readonly IMPORT_DIR: string = 'import';
  public static readonly EXPORT_DIR: string = 'export';
  public static readonly SAMPLE_FILE_NAME: string = 'sample_contacts.vcf';
  public static readonly PREFERENCE_SETTINGS: string = 'vcard_settings';
  public static readonly PREFERENCE_HISTORY: string = 'vcard_history';
  public static readonly HISTORY_LIMIT_MAX: number = 100;
}
