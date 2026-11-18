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
import { beforeEachIt } from '@ohos/hypium';
import abilityTest from './Ability.test';
import cityDataModelCoreTest from './CityDataModelCore.test';
import cityDataIntegrityCoreTest from './CityDataIntegrityCore.test';
import citySearchConstantsCoreTest from './CitySearchConstantsCore.test';
import harLoggerCoreTest from './HarLoggerCore.test';
import citySearchUiStateTest from './CitySearchUiState.test';
import citySearchSearchFlowTest from './CitySearchSearchFlow.test';
import alphabetListItemTypeCtorTest from './logic/AlphabetListItemTypeCtor.test';
import alphabetListItemTypeCtor2Test from './logic/AlphabetListItemTypeCtor2.test';
import commonConstantsValuesTest from './logic/CommonConstantsValues.test';
import searchCitiesTest from './logic/SearchCities.test';
import searchCities2Test from './logic/SearchCities2.test';
import matchedLetterIndexOfTest from './logic/MatchedLetterIndexOf.test';
import matchedLetterIndexOf2Test from './logic/MatchedLetterIndexOf2.test';
import resultCountOfTest from './logic/ResultCountOf.test';
import resultCountOf2Test from './logic/ResultCountOf2.test';
import submitValueOfTest from './logic/SubmitValueOf.test';
import submitValueOf2Test from './logic/SubmitValueOf2.test';
import submitValueOf3Test from './logic/SubmitValueOf3.test';
import showsNoResultToastTest from './logic/ShowsNoResultToast.test';
import searchStateOfTest from './logic/SearchStateOf.test';
import alphabetIndexerTest from './logic/AlphabetIndexer.test';
import letterAtIndexTest from './logic/LetterAtIndex.test';
import letterAtIndex2Test from './logic/LetterAtIndex2.test';
import letterAtIndex3Test from './logic/LetterAtIndex3.test';
import groupIndexOfLetterTest from './logic/GroupIndexOfLetter.test';
import groupIndexOfLetter2Test from './logic/GroupIndexOfLetter2.test';
import groupSizeOfTest from './logic/GroupSizeOf.test';
import hotCityAtTest from './logic/HotCityAt.test';
import hotCityAt2Test from './logic/HotCityAt2.test';
import hotCityAt3Test from './logic/HotCityAt3.test';
import isHotCityTest from './logic/IsHotCity.test';
import letterOfCityTest from './logic/LetterOfCity.test';
import defaultTextsTest from './logic/DefaultTexts.test';
import citySearchStateCtorTest from './logic/CitySearchStateCtor.test';
import citySearchStateSubmitTest from './logic/CitySearchStateSubmit.test';
import citySearchStateSubmit2Test from './logic/CitySearchStateSubmit2.test';
import citySearchStateSubmit3Test from './logic/CitySearchStateSubmit3.test';
import citySearchStateChangeTest from './logic/CitySearchStateChange.test';
import citySearchStateChange2Test from './logic/CitySearchStateChange2.test';
import citySearchStateChange3Test from './logic/CitySearchStateChange3.test';
import citySearchStatePickTest from './logic/CitySearchStatePick.test';
import citySearchStatePick2Test from './logic/CitySearchStatePick2.test';
import citySearchStatePick3Test from './logic/CitySearchStatePick3.test';
import citySearchStatePickResultTest from './logic/CitySearchStatePickResult.test';
import citySearchStateFlowTest from './logic/CitySearchStateFlow.test';
import citySearchStateFlow2Test from './logic/CitySearchStateFlow2.test';
import citySearchStateFlow3Test from './logic/CitySearchStateFlow3.test';
import citySearchStateFlow4Test from './logic/CitySearchStateFlow4.test';
import citySearchStateFlow5Test from './logic/CitySearchStateFlow5.test';
import citySearchTestBridgeConstantsTest from './logic/CitySearchTestBridgeConstants.test';

function yieldToEventLoop(): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => { resolve(); }, 1);
  });
}

export default function testsuite() {
  // 根级 beforeEachIt 会下发到每个用例：先让出 1ms 给 EventHandler，避免连续执行长时间占用主线程触发冻结检测
  beforeEachIt(yieldToEventLoop);
  abilityTest();
  cityDataModelCoreTest();
  cityDataIntegrityCoreTest();
  citySearchConstantsCoreTest();
  harLoggerCoreTest();
  citySearchUiStateTest();
  citySearchSearchFlowTest();
  alphabetListItemTypeCtorTest();
  alphabetListItemTypeCtor2Test();
  commonConstantsValuesTest();
  searchCitiesTest();
  searchCities2Test();
  matchedLetterIndexOfTest();
  matchedLetterIndexOf2Test();
  resultCountOfTest();
  resultCountOf2Test();
  submitValueOfTest();
  submitValueOf2Test();
  submitValueOf3Test();
  showsNoResultToastTest();
  searchStateOfTest();
  alphabetIndexerTest();
  letterAtIndexTest();
  letterAtIndex2Test();
  letterAtIndex3Test();
  groupIndexOfLetterTest();
  groupIndexOfLetter2Test();
  groupSizeOfTest();
  hotCityAtTest();
  hotCityAt2Test();
  hotCityAt3Test();
  isHotCityTest();
  letterOfCityTest();
  defaultTextsTest();
  citySearchStateCtorTest();
  citySearchStateSubmitTest();
  citySearchStateSubmit2Test();
  citySearchStateSubmit3Test();
  citySearchStateChangeTest();
  citySearchStateChange2Test();
  citySearchStateChange3Test();
  citySearchStatePickTest();
  citySearchStatePick2Test();
  citySearchStatePick3Test();
  citySearchStatePickResultTest();
  citySearchStateFlowTest();
  citySearchStateFlow2Test();
  citySearchStateFlow3Test();
  citySearchStateFlow4Test();
  citySearchStateFlow5Test();
  citySearchTestBridgeConstantsTest();
}
