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
import storageFormat01Test from './StorageFormat01.test';
import storageFormat02Test from './StorageFormat02.test';
import storageFormat03Test from './StorageFormat03.test';
import storageFormat04Test from './StorageFormat04.test';
import storageFormat05Test from './StorageFormat05.test';
import storageFormat06Test from './StorageFormat06.test';
import storageFormat07Test from './StorageFormat07.test';
import storageFormat08Test from './StorageFormat08.test';
import storageFormat09Test from './StorageFormat09.test';

export default function storageFormatTest(): void {
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
