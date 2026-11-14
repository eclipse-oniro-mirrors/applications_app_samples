/**
 *
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import suite01 from './Ability.test';
import suite02 from './Integration/ConcurrentPipeline.test';
import suite03 from './Integration/ParserRegression.test';
import suite04 from './Interop/RuntimeDispatch.test';
import suite05 from './Integration/ResolverPipeline.test';
import suite06 from './Models/UnicodeCardData.test';
import suite07 from './Parser/LocalLayoutParsing.test';
import suite08 from './Interop/WrapperInput.test';
import suite09 from './Integration/StaticPipeline.test';
import suite10 from './Integration/SampleLayout.test';
import suite11 from './Models/CardTitleAccess.test';
import suite12 from './Models/CardResolver.test';
import suite13 from './Parser/WidthFormula.test';
import suite14 from './DataSource/DataBinding.test';
import suite15 from './DataSource/InsertionOrder.test';
import suite16 from './Registry/ResolverDispatch.test';
import suite17 from './Interop/ResolverConversion.test';
import suite18 from './DataSource/IndexLookup.test';
import suite19 from './Models/ObjectIdentity.test';
import suite20 from './DataSource/RepeatedAppend.test';
import suite21 from './Models/StylePayload.test';
import suite22 from './Models/PayloadMutation.test';
import suite23 from './UI/CardListRendering.test';
import suite24 from './Parser/WidthReadSequence.test';
import suite25 from './Registry/ResolverReplacement.test';
import suite26 from './Parser/ParserReuse.test';
import suite27 from './DataSource/SourceIsolation.test';
import suite28 from './Parser/ErrorRecovery.test';
import suite29 from './Parser/InvalidJson.test';
import suite30 from './Interop/FactoryLifecycle.test';
import suite31 from './DataSource/IndependentSources.test';
import suite32 from './Interop/FactoryReplacement.test';
import suite33 from './Models/PayloadRoundTrip.test';
import suite34 from './Parser/RetryAfterFailure.test';
import suite35 from './Parser/BatchOrder.test';
import suite36 from './Interop/ConcurrentWrapper.test';
import suite37 from './DataSource/AppendStability.test';
import suite38 from './Models/IdentityStability.test';
import suite39 from './DataSource/LargeBatch.test';
import suite40 from './Workload/EntryWorkload.test';
import suite41 from './Workload/LibraryWorkload.test';
import suite42 from './Parser/ConcurrentParsing.test';
import suite43 from './Interop/WrapperParity.test';
import suite44 from './UI/PageLifecycle.test';
import suite45 from './Interop/WrapperRejection.test';
import suite46 from './Interop/WrapperInstanceIsolation.test';
import suite47 from './Models/CardState.test';
import suite48 from './DataSource/EmptyAndSingle.test';
import suite49 from './UI/CardListInteraction.test';
import suite50 from './Parser/InputShapes.test';
import suite51 from './Models/CardConstruction.test';
import suite52 from './Parser/GroupOrdering.test';
import suite53 from './Models/NestedPayload.test';
import suite54 from './Registry/TypeCatalog.test';
import suite55 from './Parser/Flattening.test';
import suite56 from './Integration/ResolverWorkflow.test';
import suite57 from './Registry/CreateDataContract.test';
import suite58 from './Interop/FactoryCapture.test';
import suite59 from './Registry/RegistrationIsolation.test';
import suite60 from './DataSource/ListenerContract.test';
import suite61 from './Workload/WorkloadParity.test';
import suite62 from './Interop/WrapperRecovery.test';
import suite63 from './DataSource/ListenerLifecycle.test';
import suite64 from './Parser/UnknownTypes.test';
import suite65 from './Interop/ParserResultIsolation.test';
import suite66 from './Registry/SpecialTypeKeys.test';
import suite67 from './Models/LiteralTitles.test';
import suite68 from './Parser/UnknownTypeIsolation.test';
import suite69 from './Parser/WidthMutation.test';
import suite70 from './DataSource/IndexBoundaries.test';
import suite71 from './Registry/ResolverCalls.test';
import suite72 from './Parser/MetadataPreservation.test';
import suite73 from './Models/OptionalPayload.test';
import suite74 from './DataSource/ReadConsistency.test';
import suite75 from './Parser/EmptyGroups.test';
import suite76 from './Models/PropertyKeys.test';
import suite77 from './Interop/WrapperCallAccounting.test';
import suite78 from './Models/PayloadValues.test';
import suite79 from './Integration/BundledLayout.test';
import executionBoundaryTest from './Parser/ExecutionBoundary.test';
import styleBoundaryTest from './Parser/StyleBoundary.test';
import deferredConversionTest from './Interop/DeferredConversion.test';
import conversionBoundaryTest from './Interop/ConversionBoundary.test';
import serializationBoundaryTest from './Interop/SerializationBoundary.test';
import accessBoundaryTest from './Models/AccessBoundary.test';
import factoryFailureTest from './Interop/FactoryFailure.test';
import staticInputBoundaryTest from './Integration/StaticInputBoundary.test';
import traversalMutationTest from './Parser/TraversalMutation.test';
import propertyFailureTest from './Parser/PropertyFailure.test';
import exactKeyDispatchTest from './Registry/ExactKeyDispatch.test';
import wrapperReentrancyTest from './Interop/WrapperReentrancy.test';
import nativeResultBoundaryTest from './Interop/NativeResultBoundary.test';
import serializationEffectsTest from './Interop/SerializationEffects.test';
import backingStoreTest from './DataSource/BackingStore.test';
import modelCaptureTest from './Models/ModelCapture.test';
import staticRecoveryTest from './Integration/StaticRecovery.test';

export default function testsuite(): void {
  traversalMutationTest();
  propertyFailureTest();
  exactKeyDispatchTest();
  wrapperReentrancyTest();
  nativeResultBoundaryTest();
  serializationEffectsTest();
  backingStoreTest();
  modelCaptureTest();
  staticRecoveryTest();
  executionBoundaryTest();
  styleBoundaryTest();
  deferredConversionTest();
  conversionBoundaryTest();
  serializationBoundaryTest();
  accessBoundaryTest();
  factoryFailureTest();
  staticInputBoundaryTest();
  // Ability.test.ets
  suite01();
  // Integration/ConcurrentPipeline.test.ets
  suite02();
  // Integration/ParserRegression.test.ets
  suite03();
  // Interop/RuntimeDispatch.test.ets
  suite04();
  // Integration/ResolverPipeline.test.ets
  suite05();
  // Models/UnicodeCardData.test.ets
  suite06();
  // Parser/LocalLayoutParsing.test.ets
  suite07();
  // Interop/WrapperInput.test.ets
  suite08();
  // Integration/StaticPipeline.test.ets
  suite09();
  // Integration/SampleLayout.test.ets
  suite10();
  // Models/CardTitleAccess.test.ets
  suite11();
  // Models/CardResolver.test.ets
  suite12();
  // Parser/WidthFormula.test.ets
  suite13();
  // DataSource/DataBinding.test.ets
  suite14();
  // DataSource/InsertionOrder.test.ets
  suite15();
  // Registry/ResolverDispatch.test.ets
  suite16();
  // Interop/ResolverConversion.test.ets
  suite17();
  // DataSource/IndexLookup.test.ets
  suite18();
  // Models/ObjectIdentity.test.ets
  suite19();
  // DataSource/RepeatedAppend.test.ets
  suite20();
  // Models/StylePayload.test.ets
  suite21();
  // Models/PayloadMutation.test.ets
  suite22();
  // UI/CardListRendering.test.ets
  suite23();
  // Parser/WidthReadSequence.test.ets
  suite24();
  // Registry/ResolverReplacement.test.ets
  suite25();
  // Parser/ParserReuse.test.ets
  suite26();
  // DataSource/SourceIsolation.test.ets
  suite27();
  // Parser/ErrorRecovery.test.ets
  suite28();
  // Parser/InvalidJson.test.ets
  suite29();
  // Interop/FactoryLifecycle.test.ets
  suite30();
  // DataSource/IndependentSources.test.ets
  suite31();
  // Interop/FactoryReplacement.test.ets
  suite32();
  // Models/PayloadRoundTrip.test.ets
  suite33();
  // Parser/RetryAfterFailure.test.ets
  suite34();
  // Parser/BatchOrder.test.ets
  suite35();
  // Interop/ConcurrentWrapper.test.ets
  suite36();
  // DataSource/AppendStability.test.ets
  suite37();
  // Models/IdentityStability.test.ets
  suite38();
  // DataSource/LargeBatch.test.ets
  suite39();
  // Workload/EntryWorkload.test.ets
  suite40();
  // Workload/LibraryWorkload.test.ets
  suite41();
  // Parser/ConcurrentParsing.test.ets
  suite42();
  // Interop/WrapperParity.test.ets
  suite43();
  // UI/PageLifecycle.test.ets
  suite44();
  // Interop/WrapperRejection.test.ets
  suite45();
  // Interop/WrapperInstanceIsolation.test.ets
  suite46();
  // Models/CardState.test.ets
  suite47();
  // DataSource/EmptyAndSingle.test.ets
  suite48();
  // UI/CardListInteraction.test.ets
  suite49();
  // Parser/InputShapes.test.ets
  suite50();
  // Models/CardConstruction.test.ets
  suite51();
  // Parser/GroupOrdering.test.ets
  suite52();
  // Models/NestedPayload.test.ets
  suite53();
  // Registry/TypeCatalog.test.ets
  suite54();
  // Parser/Flattening.test.ets
  suite55();
  // Integration/ResolverWorkflow.test.ets
  suite56();
  // Registry/CreateDataContract.test.ets
  suite57();
  // Interop/FactoryCapture.test.ets
  suite58();
  // Registry/RegistrationIsolation.test.ets
  suite59();
  // DataSource/ListenerContract.test.ets
  suite60();
  // Workload/WorkloadParity.test.ets
  suite61();
  // Interop/WrapperRecovery.test.ets
  suite62();
  // DataSource/ListenerLifecycle.test.ets
  suite63();
  // Parser/UnknownTypes.test.ets
  suite64();
  // Interop/ParserResultIsolation.test.ets
  suite65();
  // Registry/SpecialTypeKeys.test.ets
  suite66();
  // Models/LiteralTitles.test.ets
  suite67();
  // Parser/UnknownTypeIsolation.test.ets
  suite68();
  // Parser/WidthMutation.test.ets
  suite69();
  // DataSource/IndexBoundaries.test.ets
  suite70();
  // Registry/ResolverCalls.test.ets
  suite71();
  // Parser/MetadataPreservation.test.ets
  suite72();
  // Models/OptionalPayload.test.ets
  suite73();
  // DataSource/ReadConsistency.test.ets
  suite74();
  // Parser/EmptyGroups.test.ets
  suite75();
  // Models/PropertyKeys.test.ets
  suite76();
  // Interop/WrapperCallAccounting.test.ets
  suite77();
  // Models/PayloadValues.test.ets
  suite78();
  // Integration/BundledLayout.test.ets
  suite79();
}
