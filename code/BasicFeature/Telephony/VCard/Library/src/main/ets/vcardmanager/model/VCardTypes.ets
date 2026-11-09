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

export class CapabilityCheck {
  key: string;
  name: ResourceStr;
  supported: boolean;
  detail: ResourceStr;

  constructor(key: string, name: ResourceStr, supported: boolean, detail: ResourceStr) {
    this.key = key;
    this.name = name;
    this.supported = supported;
    this.detail = detail;
  }
}

export class PermissionState {
  name: string = '';
  declared: boolean = false;
  granted: boolean = false;
}

export class VCardCard {
  fullName: string = '';
  phones: string[] = [];
  emails: string[] = [];
  organization: string = '';
  jobTitle: string = '';
  note: string = '';
  addresses: string[] = [];
  websites: string[] = [];
  version: string = '';
}

export class VCardPreview {
  fileName: string = '';
  filePath: string = '';
  content: string = '';
  sizeBytes: number = 0;
  versionText: string = '';
  cardCount: number = 0;
  phoneCount: number = 0;
  emailCount: number = 0;
  organizationCount: number = 0;
  addressCount: number = 0;
  cards: VCardCard[] = [];
  errorMessage: string = '';
}

export class PickedFile {
  uri: string = '';
  name: string = '';
  sizeBytes: number = 0;
}

export class ImportResult {
  success: boolean = false;
  code: number = 0;
  message: string = '';
  filePath: string = '';
  fileName: string = '';
  cardCount: number = 0;
}

export class ExportResult {
  success: boolean = false;
  code: number = 0;
  message: string = '';
  filePath: string = '';
  content: string = '';
  bytes: number = 0;
  cardCount: number = 0;
  requestedCount: number = 0;
}

export class VCardSettings {
  defaultVersion: number = 0;
  defaultCharset: string = 'UTF-8';
  autoJumpToContacts: boolean = true;
  historyLimit: number = 20;
}

export class VersionChoice {
  value: number;
  label: string;
  description: ResourceStr;

  constructor(value: number, label: string, description: ResourceStr) {
    this.value = value;
    this.label = label;
    this.description = description;
  }
}

export function createVersionChoices(): VersionChoice[] {
  const choices: VersionChoice[] = [];
  choices.push(new VersionChoice(0, '2.1', $r('app.string.vc_version_desc_21')));
  choices.push(new VersionChoice(1, '3.0', $r('app.string.vc_version_desc_30')));
  choices.push(new VersionChoice(2, '4.0', $r('app.string.vc_version_desc_40')));
  return choices;
}
