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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { FileModel, FileType } from 'uploadanddownload';
import { CustomDataSource } from '../../../main/ets/components/CustomDataSource';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TEST_DOMAIN: number = 0xF811;
const TEST_TAG: string = 'SampleTest';

class RecordingDataChangeListener implements DataChangeListener {
  reloadCount: number = 0;
  deleteCount: number = 0;
  moveCount: number = 0;
  datasetChangeCount: number = 0;
  addIndexes: Array<number> = [];
  changeIndexes: Array<number> = [];

  onDataReloaded(): void {
    this.reloadCount++;
  }

  onDataAdded(index: number): void {
    this.addIndexes.push(index);
  }

  onDataAdd(index: number): void {
    this.addIndexes.push(index);
  }

  onDataMoved(from: number, to: number): void {
    this.moveCount++;
  }

  onDataMove(from: number, to: number): void {
    this.moveCount++;
  }

  onDataDeleted(index: number): void {
    this.deleteCount++;
  }

  onDataDelete(index: number): void {
    this.deleteCount++;
  }

  onDataChanged(index: number): void {
    this.changeIndexes.push(index);
  }

  onDataChange(index: number): void {
    this.changeIndexes.push(index);
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.datasetChangeCount += dataOperations.length;
  }
}

function createTextModel(): FileModel {
  return new FileModel('test.txt', false, ['http://host/test.txt']);
}

function createImageModel(): FileModel {
  return new FileModel('edge_picture.jpg', false, ['http://host/edge_picture.jpg']);
}

function createAudioModel(): FileModel {
  return new FileModel('audio_test.mp3', false, ['http://host/audio_test.mp3']);
}

export default function customDataSourceBehaviorTest(): void {
  describe('UploadDownloadCustomDataSourceBehaviorTest', () => {
    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_0100
     * @tc.name      testUploadDownloadDataSource0001
     * @tc.desc      Verify the data source keeps the constructor order and exposes each file model.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0001');
        try {
          const text: FileModel = createTextModel();
          const image: FileModel = createImageModel();
          const audio: FileModel = createAudioModel();
          const dataSource: CustomDataSource = new CustomDataSource([text, image, audio]);
          expect(dataSource.totalCount()).assertEqual(3);
          expect(dataSource.getData(0) === text).assertTrue();
          expect(dataSource.getData(1).name).assertEqual('edge_picture.jpg');
          expect(dataSource.getData(2).fileType).assertEqual(FileType.MUSIC);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_0200
     * @tc.name      testUploadDownloadDataSource0002
     * @tc.desc      Verify later changes to the source array do not change the data source content.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0002');
        try {
          const text: FileModel = createTextModel();
          const image: FileModel = createImageModel();
          const source: Array<FileModel> = [text, image];
          const dataSource: CustomDataSource = new CustomDataSource(source);
          source.pop();
          source.push(createAudioModel());
          expect(source.length).assertEqual(2);
          expect(dataSource.totalCount()).assertEqual(2);
          expect(dataSource.getData(1).name).assertEqual('edge_picture.jpg');
          expect(dataSource.getData(2)).assertUndefined();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_0300
     * @tc.name      testUploadDownloadDataSource0003
     * @tc.desc      Verify replacing the public data array changes count and indexed lookup immediately.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0003');
        try {
          const dataSource: CustomDataSource = new CustomDataSource([]);
          expect(dataSource.totalCount()).assertEqual(0);
          dataSource.dataArray = [createAudioModel()];
          expect(dataSource.totalCount()).assertEqual(1);
          expect(dataSource.getData(0).fileType).assertEqual(FileType.MUSIC);
          expect(dataSource.getData(1)).assertUndefined();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_0400
     * @tc.name      testUploadDownloadDataSource0004
     * @tc.desc      Verify a reload notification reaches every registered listener on each reload.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0004');
        try {
          const dataSource: CustomDataSource = new CustomDataSource([createTextModel()]);
          const first: RecordingDataChangeListener = new RecordingDataChangeListener();
          const second: RecordingDataChangeListener = new RecordingDataChangeListener();
          dataSource.registerDataChangeListener(first);
          dataSource.registerDataChangeListener(second);
          dataSource.notifyDataReload();
          expect(first.reloadCount).assertEqual(1);
          expect(second.reloadCount).assertEqual(1);
          dataSource.notifyDataReload();
          expect(first.reloadCount).assertEqual(2);
          expect(second.reloadCount).assertEqual(2);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_0500
     * @tc.name      testUploadDownloadDataSource0005
     * @tc.desc      Verify registering the same listener twice keeps a single subscription.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0005');
        try {
          const dataSource: CustomDataSource = new CustomDataSource([createTextModel()]);
          const listener: RecordingDataChangeListener = new RecordingDataChangeListener();
          dataSource.registerDataChangeListener(listener);
          dataSource.registerDataChangeListener(listener);
          dataSource.notifyDataReload();
          expect(listener.reloadCount).assertEqual(1);
          dataSource.unregisterDataChangeListener(listener);
          dataSource.notifyDataReload();
          expect(listener.reloadCount).assertEqual(1);
          expect(dataSource.totalCount()).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_0600
     * @tc.name      testUploadDownloadDataSource0006
     * @tc.desc      Verify add and change notifications carry the affected index and stay separate.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0006');
        try {
          const dataSource: CustomDataSource = new CustomDataSource([createTextModel(), createImageModel()]);
          const listener: RecordingDataChangeListener = new RecordingDataChangeListener();
          dataSource.registerDataChangeListener(listener);
          dataSource.notifyDataAdd(0);
          dataSource.notifyDataAdd(1);
          dataSource.notifyDataChange(1);
          expect(listener.addIndexes.length).assertEqual(2);
          expect(listener.addIndexes[0]).assertEqual(0);
          expect(listener.addIndexes[1]).assertEqual(1);
          expect(listener.changeIndexes.length).assertEqual(1);
          expect(listener.changeIndexes[0]).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_0700
     * @tc.name      testUploadDownloadDataSource0007
     * @tc.desc      Verify unregistering an unknown listener leaves existing subscriptions untouched.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0007');
        try {
          const dataSource: CustomDataSource = new CustomDataSource([createTextModel()]);
          const registered: RecordingDataChangeListener = new RecordingDataChangeListener();
          const unknown: RecordingDataChangeListener = new RecordingDataChangeListener();
          dataSource.registerDataChangeListener(registered);
          dataSource.unregisterDataChangeListener(unknown);
          dataSource.notifyDataReload();
          expect(registered.reloadCount).assertEqual(1);
          expect(unknown.reloadCount).assertEqual(0);
          dataSource.unregisterDataChangeListener(registered);
          dataSource.notifyDataReload();
          expect(registered.reloadCount).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_0800
     * @tc.name      testUploadDownloadDataSource0008
     * @tc.desc      Verify addData inserts the model at the requested index and notifies the insertion point.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0008');
        try {
          const text: FileModel = createTextModel();
          const image: FileModel = createImageModel();
          const audio: FileModel = createAudioModel();
          const inserted: FileModel = new FileModel('inserted.pdf', false, []);
          const dataSource: CustomDataSource = new CustomDataSource([text, image, audio]);
          const listener: RecordingDataChangeListener = new RecordingDataChangeListener();
          dataSource.registerDataChangeListener(listener);
          dataSource.addData(1, inserted);
          expect(dataSource.totalCount()).assertEqual(4);
          expect(dataSource.getData(1) === inserted).assertTrue();
          expect(dataSource.getData(2) === image).assertTrue();
          expect(dataSource.getData(3) === audio).assertTrue();
          expect(listener.addIndexes.length).assertEqual(1);
          expect(listener.addIndexes[0]).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_0900
     * @tc.name      testUploadDownloadDataSource0009
     * @tc.desc      Verify listener subscriptions belong to one data source instance only.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0009');
        try {
          const firstSource: CustomDataSource = new CustomDataSource([createTextModel()]);
          const secondSource: CustomDataSource = new CustomDataSource([createImageModel(), createAudioModel()]);
          const listener: RecordingDataChangeListener = new RecordingDataChangeListener();
          firstSource.registerDataChangeListener(listener);
          secondSource.notifyDataReload();
          expect(listener.reloadCount).assertEqual(0);
          firstSource.notifyDataReload();
          expect(listener.reloadCount).assertEqual(1);
          expect(secondSource.totalCount()).assertEqual(2);
          expect(secondSource.getData(0).fileType).assertEqual(FileType.IMAGE);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_1000
     * @tc.name      testUploadDownloadDataSource0010
     * @tc.desc      Verify addData inserts at the head and notifies index zero.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0010');
        try {
          const text: FileModel = createTextModel();
          const inserted: FileModel = new FileModel('head.pdf', false, []);
          const dataSource: CustomDataSource = new CustomDataSource([text]);
          const listener: RecordingDataChangeListener = new RecordingDataChangeListener();
          dataSource.registerDataChangeListener(listener);
          dataSource.addData(0, inserted);
          expect(dataSource.totalCount()).assertEqual(2);
          expect(dataSource.getData(0) === inserted).assertTrue();
          expect(dataSource.getData(1) === text).assertTrue();
          expect(listener.addIndexes[0]).assertEqual(0);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_1100
     * @tc.name      testUploadDownloadDataSource0011
     * @tc.desc      Verify addData inserts between existing entries.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0011');
        try {
          const text: FileModel = createTextModel();
          const audio: FileModel = createAudioModel();
          const inserted: FileModel = new FileModel('middle.pdf', false, []);
          const dataSource: CustomDataSource = new CustomDataSource([text, audio]);
          const listener: RecordingDataChangeListener = new RecordingDataChangeListener();
          dataSource.registerDataChangeListener(listener);
          dataSource.addData(1, inserted);
          expect(dataSource.totalCount()).assertEqual(3);
          expect(dataSource.getData(0) === text).assertTrue();
          expect(dataSource.getData(1) === inserted).assertTrue();
          expect(dataSource.getData(2) === audio).assertTrue();
          expect(listener.addIndexes[0]).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_1200
     * @tc.name      testUploadDownloadDataSource0012
     * @tc.desc      Verify addData appends when the index equals the current length.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0012');
        try {
          const text: FileModel = createTextModel();
          const audio: FileModel = createAudioModel();
          const inserted: FileModel = new FileModel('tail.pdf', false, []);
          const dataSource: CustomDataSource = new CustomDataSource([text, audio]);
          const listener: RecordingDataChangeListener = new RecordingDataChangeListener();
          dataSource.registerDataChangeListener(listener);
          dataSource.addData(2, inserted);
          expect(dataSource.totalCount()).assertEqual(3);
          expect(dataSource.getData(1) === audio).assertTrue();
          expect(dataSource.getData(2) === inserted).assertTrue();
          expect(listener.addIndexes[0]).assertEqual(2);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_1300
     * @tc.name      testUploadDownloadDataSource0013
     * @tc.desc      Verify addData inserts into an empty data source.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0013');
        try {
          const inserted: FileModel = new FileModel('only.pdf', false, []);
          const dataSource: CustomDataSource = new CustomDataSource([]);
          const listener: RecordingDataChangeListener = new RecordingDataChangeListener();
          dataSource.registerDataChangeListener(listener);
          dataSource.addData(0, inserted);
          expect(dataSource.totalCount()).assertEqual(1);
          expect(dataSource.getData(0) === inserted).assertTrue();
          expect(listener.addIndexes[0]).assertEqual(0);
          expect(listener.addIndexes.length).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_1400
     * @tc.name      testUploadDownloadDataSource0014
     * @tc.desc      Verify addData clamps an index beyond the length to the tail.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0014');
        try {
          const text: FileModel = createTextModel();
          const inserted: FileModel = new FileModel('clamped-high.pdf', false, []);
          const dataSource: CustomDataSource = new CustomDataSource([text]);
          const listener: RecordingDataChangeListener = new RecordingDataChangeListener();
          dataSource.registerDataChangeListener(listener);
          dataSource.addData(99, inserted);
          expect(dataSource.totalCount()).assertEqual(2);
          expect(dataSource.getData(0) === text).assertTrue();
          expect(dataSource.getData(1) === inserted).assertTrue();
          expect(listener.addIndexes[0]).assertEqual(1);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_1500
     * @tc.name      testUploadDownloadDataSource0015
     * @tc.desc      Verify addData clamps a negative index to the head.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0015');
        try {
          const audio: FileModel = createAudioModel();
          const text: FileModel = createTextModel();
          const inserted: FileModel = new FileModel('clamped-low.pdf', false, []);
          const dataSource: CustomDataSource = new CustomDataSource([audio, text]);
          const listener: RecordingDataChangeListener = new RecordingDataChangeListener();
          dataSource.registerDataChangeListener(listener);
          dataSource.addData(-5, inserted);
          expect(dataSource.totalCount()).assertEqual(3);
          expect(dataSource.getData(0) === inserted).assertTrue();
          expect(dataSource.getData(1) === audio).assertTrue();
          expect(listener.addIndexes[0]).assertEqual(0);
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_1600
     * @tc.name      testUploadDownloadDataSource0016
     * @tc.desc      Verify addData works without a registered listener.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0016');
        try {
          const text: FileModel = createTextModel();
          const audio: FileModel = createAudioModel();
          const inserted: FileModel = new FileModel('silent.pdf', false, []);
          const dataSource: CustomDataSource = new CustomDataSource([text, audio]);
          dataSource.addData(1, inserted);
          expect(dataSource.totalCount()).assertEqual(3);
          expect(dataSource.getData(1) === inserted).assertTrue();
          expect(dataSource.getData(2) === audio).assertTrue();
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });

    /**
     * @tc.number    SUB_BASICSERVICES_REQUEST_UPLOADDOWNLOAD_DATASOURCE_1700
     * @tc.name      testUploadDownloadDataSource0017
     * @tc.desc      Verify sequential insertions preserve order and notification indexes.
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testUploadDownloadDataSource0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        hilog.info(TEST_DOMAIN, TEST_TAG, 'start testUploadDownloadDataSource0017');
        try {
          const text: FileModel = createTextModel();
          const image: FileModel = createImageModel();
          const audio: FileModel = createAudioModel();
          const inserted: FileModel = new FileModel('sequence.pdf', false, []);
          const dataSource: CustomDataSource = new CustomDataSource([text]);
          const listener: RecordingDataChangeListener = new RecordingDataChangeListener();
          dataSource.registerDataChangeListener(listener);
          dataSource.addData(0, image);
          dataSource.addData(2, audio);
          dataSource.addData(1, inserted);
          expect(dataSource.totalCount()).assertEqual(4);
          expect(dataSource.getData(0) === image).assertTrue();
          expect(dataSource.getData(1) === inserted).assertTrue();
          expect(dataSource.getData(2) === text).assertTrue();
          expect(dataSource.getData(3) === audio).assertTrue();
          expect(listener.addIndexes.join(',')).assertEqual('0,2,1');
        } catch (err) {
          expect().assertFail();
        } finally {
          done();
        }
      });
  });
}
