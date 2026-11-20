/*
 * Copyright (c) 2023-2026 Huawei Device Co., Ltd.
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

import bptEdgeRealTest from './BptEdgeReal.test'
import bptTypeVol01Test from './BptTypeVol01.test'
import bptTypeVol01BTest from './BptTypeVol01B.test'
import bptTypeVol02Test from './BptTypeVol02.test'
import bptTypeVol02BTest from './BptTypeVol02B.test'
import bptTypeVol03Test from './BptTypeVol03.test'
import bptTypeVol03BTest from './BptTypeVol03B.test'
import bptTypeVol04Test from './BptTypeVol04.test'
import bptTypeVol04BTest from './BptTypeVol04B.test'
import bptKeyVol01Test from './BptKeyVol01.test'
import bptKeyVol01BTest from './BptKeyVol01B.test'
import sbmEdgeRealTest from './SbmEdgeReal.test'
import sbmTypeVol01Test from './SbmTypeVol01.test'
import sbmTypeVol01BTest from './SbmTypeVol01B.test'
import sbmTypeVol02Test from './SbmTypeVol02.test'
import sbmTypeVol02BTest from './SbmTypeVol02B.test'
import sbmKeyVol01Test from './SbmKeyVol01.test'
import sbmKeyVol01BTest from './SbmKeyVol01B.test'
import bstFieldReal01Test from './BstFieldReal01.test'
import bstFieldVol01Test from './BstFieldVol01.test'
import bstFieldVol01BTest from './BstFieldVol01B.test'
import bstFieldVol02Test from './BstFieldVol02.test'
import bstFieldVol02BTest from './BstFieldVol02B.test'
import bstFieldVol03Test from './BstFieldVol03.test'
import bstFieldVol03BTest from './BstFieldVol03B.test'
import bstFieldVol04Test from './BstFieldVol04.test'
import bstFieldVol04BTest from './BstFieldVol04B.test'
import mtsGridReal01Test from './MtsGridReal01.test'
import mtsGridVol01Test from './MtsGridVol01.test'
import mtsGridVol01BTest from './MtsGridVol01B.test'
import mtsGridVol02Test from './MtsGridVol02.test'
import mtsGridVol02BTest from './MtsGridVol02B.test'
import mtsGridVol03Test from './MtsGridVol03.test'
import mtsGridVol03BTest from './MtsGridVol03B.test'
import scsFieldReal01Test from './ScsFieldReal01.test'
import scsFieldVol01Test from './ScsFieldVol01.test'
import scsFieldVol01BTest from './ScsFieldVol01B.test'
import scsFieldVol02Test from './ScsFieldVol02.test'
import scsFieldVol02BTest from './ScsFieldVol02B.test'
import scsFieldVol03Test from './ScsFieldVol03.test'
import scsFieldVol03BTest from './ScsFieldVol03B.test'
import scsFieldVol04Test from './ScsFieldVol04.test'
import scsFieldVol04BTest from './ScsFieldVol04B.test'
import sstsCellReal01Test from './SstsCellReal01.test'
import sstsCellVol01Test from './SstsCellVol01.test'
import sstsCellVol01BTest from './SstsCellVol01B.test'
import sstsCellVol02Test from './SstsCellVol02.test'
import sstsCellVol02BTest from './SstsCellVol02B.test'
import sstsCellVol03Test from './SstsCellVol03.test'
import sstsCellVol03BTest from './SstsCellVol03B.test'
import sldTableReal01Test from './SldTableReal01.test'
import sldTableVol01Test from './SldTableVol01.test'
import sldTableVol01BTest from './SldTableVol01B.test'
import sldTableVol02Test from './SldTableVol02.test'
import sldTableVol02BTest from './SldTableVol02B.test'
import mdlDefaultReal01Test from './MdlDefaultReal01.test'
import mdlDefaultVol01Test from './MdlDefaultVol01.test'
import mdlDefaultVol01BTest from './MdlDefaultVol01B.test'
import mdlDefaultVol02Test from './MdlDefaultVol02.test'
import mdlDefaultVol02BTest from './MdlDefaultVol02B.test'
import uiNavReal01Test from './UiNavReal01.test'
import uiNavReal02Test from './UiNavReal02.test'
import abilityTest from './Ability.test'

export default function testsuite() {
  // L1 logic and data suites, bucket order BPT -> SBM -> BST -> MTS -> SCS -> SSTS -> SLD -> MDL.
  bptEdgeRealTest();
  bptTypeVol01Test();
  bptTypeVol01BTest();
  bptTypeVol02Test();
  bptTypeVol02BTest();
  bptTypeVol03Test();
  bptTypeVol03BTest();
  bptTypeVol04Test();
  bptTypeVol04BTest();
  bptKeyVol01Test();
  bptKeyVol01BTest();
  sbmEdgeRealTest();
  sbmTypeVol01Test();
  sbmTypeVol01BTest();
  sbmTypeVol02Test();
  sbmTypeVol02BTest();
  sbmKeyVol01Test();
  sbmKeyVol01BTest();
  bstFieldReal01Test();
  bstFieldVol01Test();
  bstFieldVol01BTest();
  bstFieldVol02Test();
  bstFieldVol02BTest();
  bstFieldVol03Test();
  bstFieldVol03BTest();
  bstFieldVol04Test();
  bstFieldVol04BTest();
  mtsGridReal01Test();
  mtsGridVol01Test();
  mtsGridVol01BTest();
  mtsGridVol02Test();
  mtsGridVol02BTest();
  mtsGridVol03Test();
  mtsGridVol03BTest();
  scsFieldReal01Test();
  scsFieldVol01Test();
  scsFieldVol01BTest();
  scsFieldVol02Test();
  scsFieldVol02BTest();
  scsFieldVol03Test();
  scsFieldVol03BTest();
  scsFieldVol04Test();
  scsFieldVol04BTest();
  sstsCellReal01Test();
  sstsCellVol01Test();
  sstsCellVol01BTest();
  sstsCellVol02Test();
  sstsCellVol02BTest();
  sstsCellVol03Test();
  sstsCellVol03BTest();
  sldTableReal01Test();
  sldTableVol01Test();
  sldTableVol01BTest();
  sldTableVol02Test();
  sldTableVol02BTest();
  mdlDefaultReal01Test();
  mdlDefaultVol01Test();
  mdlDefaultVol01BTest();
  mdlDefaultVol02Test();
  mdlDefaultVol02BTest();
  // L2 UI suites, they need the application in the foreground.
  uiNavReal01Test();
  uiNavReal02Test();
  abilityTest();
}
