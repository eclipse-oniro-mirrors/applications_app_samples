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
  public key: string;
  public name: ResourceStr;
  public supported: boolean;
  public detail: ResourceStr;

  constructor(key: string, name: ResourceStr, supported: boolean, detail: ResourceStr) {
    this.key = key;
    this.name = name;
    this.supported = supported;
    this.detail = detail;
  }
}

export class PermissionState {
  public name: string = '';
  public declared: boolean = false;
  public granted: boolean = false;
}

export class VCardCard {
  public fullName: string = '';
  public phones: string[] = [];
  public emails: string[] = [];
  public organization: string = '';
  public jobTitle: string = '';
  public note: string = '';
  public addresses: string[] = [];
  public websites: string[] = [];
  public version: string = '';
}

export class VCardPreview {
  public fileName: string = '';
  public filePath: string = '';
  public content: string = '';
  public sizeBytes: number = 0;
  public versionText: string = '';
  public cardCount: number = 0;
  public phoneCount: number = 0;
  public emailCount: number = 0;
  public organizationCount: number = 0;
  public addressCount: number = 0;
  public cards: VCardCard[] = [];
  public errorMessage: string = '';
}

export class PickedFile {
  public uri: string = '';
  public name: string = '';
  public sizeBytes: number = 0;
}

export class ImportResult {
  public success: boolean = false;
  public code: number = 0;
  public message: string = '';
  public filePath: string = '';
  public fileName: string = '';
  public cardCount: number = 0;
}

export class ExportResult {
  public success: boolean = false;
  public code: number = 0;
  public message: string = '';
  public filePath: string = '';
  public content: string = '';
  public bytes: number = 0;
  public cardCount: number = 0;
  public requestedCount: number = 0;
}

export class VCardSettings {
  public defaultVersion: number = 0;
  public defaultCharset: string = 'UTF-8';
  public autoJumpToContacts: boolean = true;
  public historyLimit: number = 20;
}

export class VersionChoice {
  public value: number;
  public label: string;
  public description: ResourceStr;

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
