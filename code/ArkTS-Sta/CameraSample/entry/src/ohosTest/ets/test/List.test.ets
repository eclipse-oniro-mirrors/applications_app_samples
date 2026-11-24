'use static';

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

// Adapted from expandPathSideEffects List.test.ets; registers the CameraSample suites.
import abilityTest from './Ability.test';
import suite01 from './Models/CommentDefaultsTest.test';
import suite02 from './Models/CommentFieldAssignmentTest.test';
import suite03 from './Models/CommentImagesTest.test';
import suite04 from './Models/CommentIdentityTest.test';
import suite05 from './Models/CommentCopyTest.test';
import suite06 from './Models/CommentUnicodeTest.test';
import suite07 from './Models/CommentBoundariesTest.test';
import suite08 from './Models/CommentLifecycleTest.test';
import suite09 from './Models/CommentSnapshotsTest.test';
import suite10 from './Models/CommentCollectionsTest.test';
import suite11 from './Models/CommentMutabilityTest.test';
import suite12 from './Models/CommentResourceTest.test';
import suite13 from './Models/CommentTimestampTest.test';
import suite14 from './Models/CommentFeedContractTest.test';
import suite15 from './Constants/CameraActionTest.test';
import suite16 from './Constants/CaptureResultKeyTest.test';
import suite17 from './Constants/ConstantsSurfaceTest.test';
import suite18 from './Logic/DateFormatTest.test';
import suite19 from './Logic/PublishGuardTest.test';
import suite20 from './Logic/PublishFlowTest.test';
import suite21 from './Logic/CameraWantTest.test';
import suite22 from './Logic/CaptureResultTest.test';
import suite23 from './Logic/ImageGridKeysTest.test';
import suite24 from './Logic/FeedJournalTest.test';
import suite25 from './Logic/TextInputStateTest.test';
import suite26 from './Logic/CaptureStateTest.test';
import suite27 from './Logic/DraftFactoryTest.test';
import suite28 from './Logic/IdSequenceTest.test';
import suite29 from './Logic/ResourceUriTest.test';
import suite30 from './Validation/DraftValidationTest.test';
import suite31 from './Validation/ImageValidationTest.test';
import suite32 from './Validation/PublishEligibilityTest.test';
import suite33 from './Validation/ContentBoundaryTest.test';
import suite34 from './Validation/UriValidationTest.test';
import suite35 from './Validation/GuardMatrixTest.test';
import suite36 from './Validation/DraftCodecValidationTest.test';
import suite37 from './Validation/InputTextValidationTest.test';
import suite38 from './Integration/CapturePublishPipelineTest.test';
import suite39 from './Integration/FeedRenderingDataTest.test';
import suite40 from './Integration/ResultPipelineTest.test';
import suite41 from './Integration/StateResetFlowTest.test';
import suite42 from './Integration/MultiPublishFlowTest.test';
import suite43 from './Integration/MixedFeedFlowTest.test';
import suite44 from './Integration/JournalWorkflowTest.test';
import suite45 from './Integration/ConstantsIntegrationTest.test';
import suite46 from './Integration/FeedQueryTest.test';
import suite47 from './Integration/CodecWorkflowTest.test';
import suite48 from './Workload/PublishWorkloadTest.test';
import suite49 from './Workload/FeedWorkloadTest.test';
import suite50 from './Workload/ImageKeyWorkloadTest.test';
import suite51 from './Workload/CodecWorkloadTest.test';
import suite52 from './Workload/QueryWorkloadTest.test';
import suite53 from './Workload/MixedWorkloadTest.test';
import suite54 from './DataFlow/SnapshotFlowTest.test';
import suite55 from './DataFlow/DraftFlowTest.test';
import suite56 from './DataFlow/ImageFlowTest.test';
import suite57 from './DataFlow/CaptureFlowTest.test';
import suite58 from './DataFlow/JournalFlowTest.test';
import suite59 from './DataFlow/FeedProjectionTest.test';

export default function testsuite(): void {
  abilityTest();
  suite01();
  suite02();
  suite03();
  suite04();
  suite05();
  suite06();
  suite07();
  suite08();
  suite09();
  suite10();
  suite11();
  suite12();
  suite13();
  suite14();
  suite15();
  suite16();
  suite17();
  suite18();
  suite19();
  suite20();
  suite21();
  suite22();
  suite23();
  suite24();
  suite25();
  suite26();
  suite27();
  suite28();
  suite29();
  suite30();
  suite31();
  suite32();
  suite33();
  suite34();
  suite35();
  suite36();
  suite37();
  suite38();
  suite39();
  suite40();
  suite41();
  suite42();
  suite43();
  suite44();
  suite45();
  suite46();
  suite47();
  suite48();
  suite49();
  suite50();
  suite51();
  suite52();
  suite53();
  suite54();
  suite55();
  suite56();
  suite57();
  suite58();
  suite59();
}
