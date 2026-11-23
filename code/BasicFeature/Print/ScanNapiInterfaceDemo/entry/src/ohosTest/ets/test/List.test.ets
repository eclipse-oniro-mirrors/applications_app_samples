/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import scanTest from './Scan.test';
import scanErrorMapVolume01Test from './ScanErrorMapVolume01.test';
import scanErrorMapVolume02Test from './ScanErrorMapVolume02.test';
import scanErrorMapVolume03Test from './ScanErrorMapVolume03.test';
import scanErrorMapVolume04Test from './ScanErrorMapVolume04.test';
import scanErrorMapVolume05Test from './ScanErrorMapVolume05.test';
import scanErrorMapReal01Test from './ScanErrorMapReal01.test';
import scanErrorMapReal02Test from './ScanErrorMapReal02.test';
import scanConstraintVolume01Test from './ScanConstraintVolume01.test';
import scanConstraintVolume02Test from './ScanConstraintVolume02.test';
import scanConstraintVolume03Test from './ScanConstraintVolume03.test';
import scanConstraintReal01Test from './ScanConstraintReal01.test';
import scanStateVolume01Test from './ScanStateVolume01.test';
import scanStateReal01Test from './ScanStateReal01.test';
import scanOptionVolume01Test from './ScanOptionVolume01.test';
import scanOptionReal01Test from './ScanOptionReal01.test';
import scanProgressVolume01Test from './ScanProgressVolume01.test';
import scanProgressReal01Test from './ScanProgressReal01.test';
import scanDirectoryVolume01Test from './ScanDirectoryVolume01.test';
import scanDirectoryReal01Test from './ScanDirectoryReal01.test';
import scanImageNamingVolume01Test from './ScanImageNamingVolume01.test';
import scanImageNamingReal01Test from './ScanImageNamingReal01.test';
import scanUnitFormatVolume01Test from './ScanUnitFormatVolume01.test';
import scanUnitFormatReal01Test from './ScanUnitFormatReal01.test';
import scanMockSourceVolume01Test from './ScanMockSourceVolume01.test';
import scanMockSourceReal01Test from './ScanMockSourceReal01.test';
import scanUiReal01Test from './ScanUiReal01.test';
import scanParamMapVolume01Test from './ScanParamMapVolume01.test';
import scanParamShapeVolume01Test from './ScanParamShapeVolume01.test';
import scanParamStructVolume01Test from './ScanParamStructVolume01.test';
import scanParamBuilderRealTest from './ScanParamBuilderReal01.test';
import scanFilterVolume01Test from './ScanFilterVolume01.test';
import scanFilterReal01Test from './ScanFilterReal01.test';
import scanFormatVolume01Test from './ScanFormatVolume01.test';
import scanFormatReal01Test from './ScanFormatReal01.test';
import scanParserVolume01Test from './ScanParserVolume01.test';
import scanParserReal01Test from './ScanParserReal01.test';
import scanSessionVolume01Test from './ScanSessionVolume01.test';
import scanSessionReal01Test from './ScanSessionReal01.test';
import scanOptionMatrixVolume01Test from './ScanOptionMatrixVolume01.test';
import scanOptionMatrixReal01Test from './ScanOptionMatrixReal01.test';
import scanStateMatrixVolume01Test from './ScanStateMatrixVolume01.test';
import scanStateMatrixReal01Test from './ScanStateMatrixReal01.test';
import scanParamTopupVolume01Test from './ScanParamTopupVolume01.test';
import scanOptionTopupVolume01Test from './ScanOptionTopupVolume01.test';

export default function testsuite() {
  // The UI suite boots the entry page, so it runs first on a cold test process.
  scanUiReal01Test();
  abilityTest();
  scanTest();
  scanErrorMapVolume01Test();
  scanErrorMapVolume02Test();
  scanErrorMapVolume03Test();
  scanErrorMapVolume04Test();
  scanErrorMapVolume05Test();
  scanErrorMapReal01Test();
  scanErrorMapReal02Test();
  scanConstraintVolume01Test();
  scanConstraintVolume02Test();
  scanConstraintVolume03Test();
  scanConstraintReal01Test();
  scanStateVolume01Test();
  scanStateReal01Test();
  scanOptionVolume01Test();
  scanOptionReal01Test();
  scanProgressVolume01Test();
  scanProgressReal01Test();
  scanDirectoryVolume01Test();
  scanDirectoryReal01Test();
  scanImageNamingVolume01Test();
  scanImageNamingReal01Test();
  scanUnitFormatVolume01Test();
  scanUnitFormatReal01Test();
  scanMockSourceVolume01Test();
  scanMockSourceReal01Test();
  scanParamMapVolume01Test();
  scanParamShapeVolume01Test();
  scanParamStructVolume01Test();
  scanParamBuilderRealTest();
  scanFilterVolume01Test();
  scanFilterReal01Test();
  scanFormatVolume01Test();
  scanFormatReal01Test();
  scanParserVolume01Test();
  scanParserReal01Test();
  scanSessionVolume01Test();
  scanSessionReal01Test();
  scanOptionMatrixVolume01Test();
  scanOptionMatrixReal01Test();
  scanStateMatrixVolume01Test();
  scanStateMatrixReal01Test();
  scanParamTopupVolume01Test();
  scanOptionTopupVolume01Test();
}