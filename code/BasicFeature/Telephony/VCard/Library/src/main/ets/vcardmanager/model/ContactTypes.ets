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

export enum ContactLoadState {
  IDLE = 0,
  LOADING = 1,
  READY = 2,
  DENIED = 3,
  ERROR = 4
}

export class ContactSummary {
  id: number = -1;
  key: string = '';
  fullName: string = '';
  initial: string = '#';
  phones: string[] = [];
  emails: string[] = [];
  organization: string = '';
  jobTitle: string = '';
  addresses: string[] = [];
  websites: string[] = [];
  note: string = '';
}

export class ContactDraft {
  fullName: string = '';
  phone: string = '';
  email: string = '';
  organization: string = '';
  jobTitle: string = '';
  note: string = '';
}
