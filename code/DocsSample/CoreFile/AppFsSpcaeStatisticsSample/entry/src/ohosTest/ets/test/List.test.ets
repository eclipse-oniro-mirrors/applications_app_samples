/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import abilityTest from './Ability.test';
import storageQueryTest from './StorageQuery.test';
import storageRoutingSuite01Test from './StorageRoutingSuite01.test';
import storageRoutingSuite02Test from './StorageRoutingSuite02.test';
import storageRoutingSuite03Test from './StorageRoutingSuite03.test';
import storageRoutingSuite04Test from './StorageRoutingSuite04.test';
import storageUsagePart01Test from './StorageUsagePart01.test';
import storageUsagePart02Test from './StorageUsagePart02.test';
import storageUsagePart03Test from './StorageUsagePart03.test';
import storageUsagePart04Test from './StorageUsagePart04.test';
import storageUsagePart05Test from './StorageUsagePart05.test';
import storageFormat01Test from './StorageFormat01.test';
import storageFormat02Test from './StorageFormat02.test';
import storageFormat03Test from './StorageFormat03.test';
import storageFormat04Test from './StorageFormat04.test';
import storageFormat05Test from './StorageFormat05.test';
import storageFormat06Test from './StorageFormat06.test';
import storageFormat07Test from './StorageFormat07.test';
import storageFormat08Test from './StorageFormat08.test';
import storageFormat09Test from './StorageFormat09.test';

export default function testsuite(): void {
  abilityTest();
  storageQueryTest();
  storageRoutingSuite01Test();
  storageRoutingSuite02Test();
  storageRoutingSuite03Test();
  storageRoutingSuite04Test();
  storageUsagePart01Test();
  storageUsagePart02Test();
  storageUsagePart03Test();
  storageUsagePart04Test();
  storageUsagePart05Test();
  storageFormat01Test();
  storageFormat02Test();
  storageFormat03Test();
  storageFormat04Test();
  storageFormat05Test();
  storageFormat06Test();
  storageFormat07Test();
  storageFormat08Test();
  storageFormat09Test();
}