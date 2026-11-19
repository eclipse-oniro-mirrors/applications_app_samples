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

import { beforeEachIt } from '@ohos/hypium';
import abilityTest from './Ability.test';
import immersiveConstantsCoreTest from './ImmersiveConstantsCore.test';
import goodsModelCoreTest from './GoodsModelCore.test';
import commentDataSourceCoreTest from './CommentDataSourceCore.test';
import commentDataSourceExtendedTest from './CommentDataSourceExtended.test';
import navHomeUiStateTest from './NavHomeUiState.test';
import goodsDetailNavigationTest from './GoodsDetailNavigation.test';
import commentDialogUiStateTest from './CommentDialogUiState.test';
import constantsValuesTest from './logic/ConstantsValues.test';
import commentDataSourceTotalCountTest from './logic/CommentDataSourceTotalCount.test';
import commentDataSourceGetDataTest from './logic/CommentDataSourceGetData.test';
import commentDataSourceFlowTest from './logic/CommentDataSourceFlow.test';
import commentDataSourceFlow2Test from './logic/CommentDataSourceFlow2.test';
import commentDataSourceFlow3Test from './logic/CommentDataSourceFlow3.test';
import commentDataSourceFlow4Test from './logic/CommentDataSourceFlow4.test';
import commentDataSourceFlow5Test from './logic/CommentDataSourceFlow5.test';
import commentDataSourceFlow6Test from './logic/CommentDataSourceFlow6.test';
import commentDataSourceFlow7Test from './logic/CommentDataSourceFlow7.test';
import commentDataSourceFlow8Test from './logic/CommentDataSourceFlow8.test';
import commentDataSourceFlow9Test from './logic/CommentDataSourceFlow9.test';
import commentDataSourceFlow10Test from './logic/CommentDataSourceFlow10.test';
import commentDataSourceFlow11Test from './logic/CommentDataSourceFlow11.test';
import commentDataSourceFlow12Test from './logic/CommentDataSourceFlow12.test';
import commentDataSourceFlow13Test from './logic/CommentDataSourceFlow13.test';
import commentDataSourceFlow14Test from './logic/CommentDataSourceFlow14.test';
import commentDataSourceFlow15Test from './logic/CommentDataSourceFlow15.test';
import commentDataSourceFlow16Test from './logic/CommentDataSourceFlow16.test';
import commentDataSourceFlow17Test from './logic/CommentDataSourceFlow17.test';
import commentDataSourceFlow18Test from './logic/CommentDataSourceFlow18.test';
import commentDataSourceFlow19Test from './logic/CommentDataSourceFlow19.test';
import commentDataSourceFlow20Test from './logic/CommentDataSourceFlow20.test';
import commentDataSourceFlow21Test from './logic/CommentDataSourceFlow21.test';
import commentDataSourceFlow22Test from './logic/CommentDataSourceFlow22.test';
import commentDataSourceFlow23Test from './logic/CommentDataSourceFlow23.test';
import commentDataSourceFlow24Test from './logic/CommentDataSourceFlow24.test';
import commentDataSourceFlow25Test from './logic/CommentDataSourceFlow25.test';
import commentDataSourceFlow26Test from './logic/CommentDataSourceFlow26.test';
import commentDataSourceFlow27Test from './logic/CommentDataSourceFlow27.test';
import commentDataSourceFlow28Test from './logic/CommentDataSourceFlow28.test';
import commentDataSourceFlow29Test from './logic/CommentDataSourceFlow29.test';
import commentDataSourceFlow30Test from './logic/CommentDataSourceFlow30.test';

function yieldToEventLoop(): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, 1);
  });
}

export default function testsuite() {
  beforeEachIt(yieldToEventLoop);
  abilityTest();
  immersiveConstantsCoreTest();
  goodsModelCoreTest();
  commentDataSourceCoreTest();
  commentDataSourceExtendedTest();
  navHomeUiStateTest();
  goodsDetailNavigationTest();
  commentDialogUiStateTest();
  constantsValuesTest();
  commentDataSourceTotalCountTest();
  commentDataSourceGetDataTest();
  commentDataSourceFlowTest();
  commentDataSourceFlow2Test();
  commentDataSourceFlow3Test();
  commentDataSourceFlow4Test();
  commentDataSourceFlow5Test();
  commentDataSourceFlow6Test();
  commentDataSourceFlow7Test();
  commentDataSourceFlow8Test();
  commentDataSourceFlow9Test();
  commentDataSourceFlow10Test();
  commentDataSourceFlow11Test();
  commentDataSourceFlow12Test();
  commentDataSourceFlow13Test();
  commentDataSourceFlow14Test();
  commentDataSourceFlow15Test();
  commentDataSourceFlow16Test();
  commentDataSourceFlow17Test();
  commentDataSourceFlow18Test();
  commentDataSourceFlow19Test();
  commentDataSourceFlow20Test();
  commentDataSourceFlow21Test();
  commentDataSourceFlow22Test();
  commentDataSourceFlow23Test();
  commentDataSourceFlow24Test();
  commentDataSourceFlow25Test();
  commentDataSourceFlow26Test();
  commentDataSourceFlow27Test();
  commentDataSourceFlow28Test();
  commentDataSourceFlow29Test();
  commentDataSourceFlow30Test();
}
