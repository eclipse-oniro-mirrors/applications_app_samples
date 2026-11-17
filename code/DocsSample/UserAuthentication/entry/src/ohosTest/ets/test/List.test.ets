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

import userAuthTest from './UserAuth.test';
import userAuthContractTest from './UserAuthContract.test';
import userAuthMatrixPart01Test from './UserAuthMatrixPart01.test';
import userAuthMatrixPart02Test from './UserAuthMatrixPart02.test';
import userAuthMorePart01Test from './UserAuthMorePart01.test';
import userAuthMorePart02Test from './UserAuthMorePart02.test';
import userAuthMorePart03Test from './UserAuthMorePart03.test';

export default function testsuite() {
  userAuthTest();
  userAuthContractTest();
  userAuthMatrixPart01Test();
  userAuthMatrixPart02Test();
  userAuthMorePart01Test();
  userAuthMorePart02Test();
  userAuthMorePart03Test();
}
