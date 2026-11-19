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

import colorSpaceDataLogicTest from './ColorSpaceDataLogic.test';
import indexPageTest from './IndexPageTest.test';
import standardColorSpaceTest from './StandardColorSpaceTest.test';
import customColorSpaceTest from './CustomColorSpaceTest.test';
import concurrencyTest from './ConcurrencyTest.test';
import exceptionTest from './ExceptionTest.test';
import navigationFlowTest from './NavigationFlowTest.test';
import apiPropertyTest from './ApiPropertyTest.test';
import colorSpacePropertyTest from './ColorSpacePropertyTest.test';
import gammaInputTest from './GammaInputTest.test';
import compareCombinationTest from './CompareCombinationTest.test';
import navigationStateTest from './NavigationStateTest.test';
import exceptionButtonTest from './ExceptionButtonTest.test';
import colorSpaceValueMatrixTest from './ColorSpaceValueMatrix.test';
import colorSpaceLimitMatrixTest from './ColorSpaceLimitMatrix.test';
import colorSpaceNameBranchTest from './ColorSpaceNameBranch.test';
import customInputMatrixTest from './CustomInputMatrix.test';
import sliderBoundaryTest from './SliderBoundary.test';
import compareScaleMatrixTest from './CompareScaleMatrix.test';
import channelConsistencyTest from './ChannelConsistency.test';
import exceptionOutcomeTest from './ExceptionOutcome.test';
import colorMathTest from './ColorMathTest.test';
import chromaticityDiagramTest from './ChromaticityDiagramTest.test';
import colorDifferenceTest from './ColorDifferenceTest.test';
import colorConversionTest from './ColorConversionTest.test';
import concurrencyBenchmarkTest from './ConcurrencyBenchmarkTest.test';
import colorSpaceReportTest from './ColorSpaceReportTest.test';
import utilsSuite01 from './utils/UtilsSuite01.test';
import utilsSuite02 from './utils/UtilsSuite02.test';
import utilsSuite03 from './utils/UtilsSuite03.test';
import utilsSuite04 from './utils/UtilsSuite04.test';
import utilsSuite05 from './utils/UtilsSuite05.test';
import utilsSuite06 from './utils/UtilsSuite06.test';
import utilsSuite07 from './utils/UtilsSuite07.test';
import utilsSuite08 from './utils/UtilsSuite08.test';
import utilsSuite09 from './utils/UtilsSuite09.test';
import utilsSuite10 from './utils/UtilsSuite10.test';
import utilsSuite11 from './utils/UtilsSuite11.test';
import utilsSuite12 from './utils/UtilsSuite12.test';
import utilsSuite13 from './utils/UtilsSuite13.test';
import utilsSuite14 from './utils/UtilsSuite14.test';
import utilsSuite15 from './utils/UtilsSuite15.test';

export default function testsuite(): void {
    colorSpaceDataLogicTest();
    indexPageTest();
    standardColorSpaceTest();
    customColorSpaceTest();
    concurrencyTest();
    exceptionTest();
    navigationFlowTest();
    apiPropertyTest();
    colorSpacePropertyTest();
    gammaInputTest();
    compareCombinationTest();
    navigationStateTest();
    exceptionButtonTest();
    colorSpaceValueMatrixTest();
    colorSpaceLimitMatrixTest();
    colorSpaceNameBranchTest();
    customInputMatrixTest();
    sliderBoundaryTest();
    compareScaleMatrixTest();
    channelConsistencyTest();
    exceptionOutcomeTest();
    colorMathTest();
    chromaticityDiagramTest();
    colorDifferenceTest();
    colorConversionTest();
    concurrencyBenchmarkTest();
    colorSpaceReportTest();
    utilsSuite01();
    utilsSuite02();
    utilsSuite03();
    utilsSuite04();
    utilsSuite05();
    utilsSuite06();
    utilsSuite07();
    utilsSuite08();
    utilsSuite09();
    utilsSuite10();
    utilsSuite11();
    utilsSuite12();
    utilsSuite13();
    utilsSuite14();
    utilsSuite15();
}
