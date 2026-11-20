/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import gameRuleComprehensiveTest from './gamerule/GameRuleComprehensive.test'
import gameRuleConstructorTest from './gamerule/GameRuleConstructor.test'
import gameRuleDataChangeTest from './gamerule/GameRuleDataChange.test'
import gameRuleDirectionMatrixTest from './gamerule/GameRuleDirectionMatrix.test'
import gameRuleEdgeCasesTest from './gamerule/GameRuleEdgeCases.test'
import gameRuleFullBoardTest from './gamerule/GameRuleFullBoard.test'
import gameRuleGameOverTest from './gamerule/GameRuleGameOver.test'
import gameRuleInitTest from './gamerule/GameRuleInit.test'
import gameRuleLongSequenceTest from './gamerule/GameRuleLongSequence.test'
import gameRuleMergeRulesTest from './gamerule/GameRuleMergeRules.test'
import gameRuleMoveContractTest from './gamerule/GameRuleMoveContract.test'
import gameRuleMoveDownTest from './gamerule/GameRuleMoveDown.test'
import gameRuleMoveInRowTest from './gamerule/GameRuleMoveInRow.test'
import gameRuleMoveLeftTest from './gamerule/GameRuleMoveLeft.test'
import gameRuleMoveRightTest from './gamerule/GameRuleMoveRight.test'
import gameRuleMoveSpawnTest from './gamerule/GameRuleMoveSpawn.test'
import gameRuleMoveUpTest from './gamerule/GameRuleMoveUp.test'
import gameRuleNoOpTest from './gamerule/GameRuleNoOp.test'
import gameRulePropertyTest from './gamerule/GameRuleProperty.test'
import gameRuleRandomNumTest from './gamerule/GameRuleRandomNum.test'
import gameRuleRestartFlowTest from './gamerule/GameRuleRestartFlow.test'
import gameRuleScoreTest from './gamerule/GameRuleScore.test'
import gameRuleScoreMatrixTest from './gamerule/GameRuleScoreMatrix.test'
import gameRuleSequenceTest from './gamerule/GameRuleSequence.test'
import dataTypeTest from './model/DataType.test'
import gameDataConstantsTest from './model/GameDataConstants.test'
import loggerTest from './model/Logger.test'
import textColorTest from './model/TextColor.test'
import tileColorMappingTest from './model/TileColorMapping.test'
import tileValueContractTest from './model/TileValueContract.test'
import myDataSourceAccessTest from './model/MyDataSourceAccess.test'
import myDataSourceCoreTest from './model/MyDataSourceCore.test'
import myDataSourceLifecycleTest from './model/MyDataSourceLifecycle.test'
import myDataSourceListenerTest from './model/MyDataSourceListener.test'
import myDataSourceNotificationMatrixTest from './model/MyDataSourceNotificationMatrix.test'
import appFlowContractTest from './app/AppFlowContract.test'
import appIntegrationTest from './app/AppIntegration.test'
import displayMathTest from './app/DisplayMath.test'
import gameSessionTest from './app/GameSession.test'
import gameSessionPersistenceTest from './app/GameSessionPersistence.test'
import gameSnapshotTest from './app/GameSnapshot.test'
import indexPresentationLogicTest from './app/IndexPresentationLogic.test'
import persistenceTest from './app/Persistence.test'
import serializationTest from './app/Serialization.test'
import indexUiPersistenceTest from './ui/IndexUiPersistence.test'

/**
 * Entry point of the Game2048 device test package.
 * Logic, model, persistence and integration suites are registered here.
 * The page-automation suites remain in ui/ but are not registered in this
 * environment because ability/window state cannot be made deterministic.
 */
export default function testsuite() {
  gameRuleComprehensiveTest()
  gameRuleConstructorTest()
  gameRuleDataChangeTest()
  gameRuleDirectionMatrixTest()
  gameRuleEdgeCasesTest()
  gameRuleFullBoardTest()
  gameRuleGameOverTest()
  gameRuleInitTest()
  gameRuleLongSequenceTest()
  gameRuleMergeRulesTest()
  gameRuleMoveContractTest()
  gameRuleMoveDownTest()
  gameRuleMoveInRowTest()
  gameRuleMoveLeftTest()
  gameRuleMoveRightTest()
  gameRuleMoveSpawnTest()
  gameRuleMoveUpTest()
  gameRuleNoOpTest()
  gameRulePropertyTest()
  gameRuleRandomNumTest()
  gameRuleRestartFlowTest()
  gameRuleScoreTest()
  gameRuleScoreMatrixTest()
  gameRuleSequenceTest()
  dataTypeTest()
  gameDataConstantsTest()
  loggerTest()
  textColorTest()
  tileColorMappingTest()
  tileValueContractTest()
  myDataSourceAccessTest()
  myDataSourceCoreTest()
  myDataSourceLifecycleTest()
  myDataSourceListenerTest()
  myDataSourceNotificationMatrixTest()
  appFlowContractTest()
  appIntegrationTest()
  displayMathTest()
  gameSessionTest()
  gameSessionPersistenceTest()
  gameSnapshotTest()
  indexPresentationLogicTest()
  persistenceTest()
  serializationTest()
  indexUiPersistenceTest()
}
