/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import NdkRawfileListCoreTest from './NdkRawfileListCore.test'
import NdkRawfileContentCoreTest from './NdkRawfileContentCore.test'
import NdkRawfileContent64CoreTest from './NdkRawfileContent64Core.test'
import NdkRawfileDescriptorCoreTest from './NdkRawfileDescriptorCore.test'
import NdkRawfileLoggerCoreTest from './NdkRawfileLoggerCore.test'
import NdkRawfileUiStateTest from './NdkRawfileUiState.test'
import IndexTest from './Index.test'
import seekAppliesTest from './logic/SeekApplies.test';
import readLengthOfTest from './logic/ReadLengthOf.test';
import readLengthOf2Test from './logic/ReadLengthOf2.test';
import readStartOfTest from './logic/ReadStartOf.test';
import readStartOf2Test from './logic/ReadStartOf2.test';
import bytesReadOfTest from './logic/BytesReadOf.test';
import bytesReadOf2Test from './logic/BytesReadOf2.test';
import bufferLengthOfTest from './logic/BufferLengthOf.test';
import bufferLengthOf2Test from './logic/BufferLengthOf2.test';
import paddingBytesOfTest from './logic/PaddingBytesOf.test';
import paddingBytesOf2Test from './logic/PaddingBytesOf2.test';
import decodedContentOfTest from './logic/DecodedContentOf.test';
import decodedContentOf2Test from './logic/DecodedContentOf2.test';
import visibleContentOfTest from './logic/VisibleContentOf.test';
import visibleContentOf2Test from './logic/VisibleContentOf2.test';
import receivedFileNameOfTest from './logic/ReceivedFileNameOf.test';
import fileListJsonOfTest from './logic/FileListJsonOf.test';
import fileListLabelOfTest from './logic/FileListLabelOf.test';
import contentLabelOfTest from './logic/ContentLabelOf.test';
import offsetContentLabelOfTest from './logic/OffsetContentLabelOf.test';
import content64LabelOfTest from './logic/Content64LabelOf.test';
import offsetContent64LabelOfTest from './logic/OffsetContent64LabelOf.test';
import descriptorLabelOfTest from './logic/DescriptorLabelOf.test';
import descriptorLabelOf2Test from './logic/DescriptorLabelOf2.test';
import shouldReleaseTest from './logic/ShouldRelease.test';
import descriptorEndOfTest from './logic/DescriptorEndOf.test';
import descriptorEndOf2Test from './logic/DescriptorEndOf2.test';
import rawfilePageStateCtorTest from './logic/RawfilePageStateCtor.test';
import rawfilePageStateAppearTest from './logic/RawfilePageStateAppear.test';
import rawfilePageStateAppear2Test from './logic/RawfilePageStateAppear2.test';
import rawfilePageStateAppear3Test from './logic/RawfilePageStateAppear3.test';
import rawfilePageStateOpenDescriptorsTest from './logic/RawfilePageStateOpenDescriptors.test';
import rawfilePageStateOpenDescriptors2Test from './logic/RawfilePageStateOpenDescriptors2.test';
import rawfilePageStateDisappearTest from './logic/RawfilePageStateDisappear.test';
import rawfilePageStateListLabelTest from './logic/RawfilePageStateListLabel.test';
import rawfilePageStateFlowTest from './logic/RawfilePageStateFlow.test';
import rawfilePageStateFlow2Test from './logic/RawfilePageStateFlow2.test';
import rawfilePageStateFlow3Test from './logic/RawfilePageStateFlow3.test';
import rawfilePageStateFlow4Test from './logic/RawfilePageStateFlow4.test';
import ndkRawfileLogicConstantsTest from './logic/NdkRawfileLogicConstants.test';

export default function testsuite() {
  NdkRawfileListCoreTest()
  NdkRawfileContentCoreTest()
  NdkRawfileContent64CoreTest()
  NdkRawfileDescriptorCoreTest()
  NdkRawfileLoggerCoreTest()
  NdkRawfileUiStateTest()
  IndexTest()
  seekAppliesTest();
  readLengthOfTest();
  readLengthOf2Test();
  readStartOfTest();
  readStartOf2Test();
  bytesReadOfTest();
  bytesReadOf2Test();
  bufferLengthOfTest();
  bufferLengthOf2Test();
  paddingBytesOfTest();
  paddingBytesOf2Test();
  decodedContentOfTest();
  decodedContentOf2Test();
  visibleContentOfTest();
  visibleContentOf2Test();
  receivedFileNameOfTest();
  fileListJsonOfTest();
  fileListLabelOfTest();
  contentLabelOfTest();
  offsetContentLabelOfTest();
  content64LabelOfTest();
  offsetContent64LabelOfTest();
  descriptorLabelOfTest();
  descriptorLabelOf2Test();
  shouldReleaseTest();
  descriptorEndOfTest();
  descriptorEndOf2Test();
  rawfilePageStateCtorTest();
  rawfilePageStateAppearTest();
  rawfilePageStateAppear2Test();
  rawfilePageStateAppear3Test();
  rawfilePageStateOpenDescriptorsTest();
  rawfilePageStateOpenDescriptors2Test();
  rawfilePageStateDisappearTest();
  rawfilePageStateListLabelTest();
  rawfilePageStateFlowTest();
  rawfilePageStateFlow2Test();
  rawfilePageStateFlow3Test();
  rawfilePageStateFlow4Test();
  ndkRawfileLogicConstantsTest();
}
