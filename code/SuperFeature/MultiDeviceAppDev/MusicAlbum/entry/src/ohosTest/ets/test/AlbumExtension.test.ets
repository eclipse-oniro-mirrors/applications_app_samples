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

import { describe, it, expect } from '@ohos/hypium';
import MyDataSource, { SongItem } from '../../../main/ets/model/SongModule';
import { optionList, songList } from '../../../main/ets/model/SongList';
import {
  ALBUM_FONT_LG,
  ALBUM_FONT_MD,
  ALBUM_FONT_SM,
  ALBUM_MARGIN_LG,
  ALBUM_MARGIN_MD,
  ALBUM_MARGIN_SM,
  ALBUM_MISSING_ID,
  ALBUM_OPTION_COUNT,
  ALBUM_TRACK_COUNT,
  AlbumModel,
  AlbumOption,
  AlbumTrack
} from './Shared/AlbumModel';

const DATASET = 'AlbumExtensionTest_';

class AlbumListener implements DataChangeListener {
  name: string = '';
  log: string[] = [];
  reloadCount: number = 0;
  addCount: number = 0;
  changeCount: number = 0;
  deleteCount: number = 0;
  moveCount: number = 0;
  lastAddIndex: number = -1;
  lastMoveFrom: number = -1;
  lastMoveTo: number = -1;

  constructor(name: string, log: string[]) {
    this.name = name;
    this.log = log;
  }

  onDataReloaded(reuseImmediately?: boolean): void {
    this.reloadCount++;
    this.log.push(this.name + ':reload');
  }

  onDataAdded(index: number): void {
    this.addCount++;
    this.lastAddIndex = index;
    this.log.push(this.name + ':add');
  }

  onDataAdd(index: number): void {
    this.addCount++;
    this.lastAddIndex = index;
    this.log.push(this.name + ':add');
  }

  onDataMoved(from: number, to: number): void {
    this.moveCount++;
    this.lastMoveFrom = from;
    this.lastMoveTo = to;
    this.log.push(this.name + ':move');
  }

  onDataMove(from: number, to: number): void {
    this.moveCount++;
    this.lastMoveFrom = from;
    this.lastMoveTo = to;
    this.log.push(this.name + ':move');
  }

  onDataDeleted(index: number): void {
    this.deleteCount++;
    this.log.push(this.name + ':delete');
  }

  onDataDelete(index: number): void {
    this.deleteCount++;
    this.log.push(this.name + ':delete');
  }

  onDataChanged(index: number): void {
    this.changeCount++;
    this.log.push(this.name + ':change');
  }

  onDataChange(index: number): void {
    this.changeCount++;
    this.log.push(this.name + ':change');
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.changeCount++;
    this.log.push(this.name + ':dataset');
  }
}

function makeTrack(id: number, title: string): SongItem {
  const track: SongItem = { id: id, title: title, singer: 'singer', label: $r('app.media.ic_SQ') };
  return track;
}

export default function albumExtensionSuite() {
  describe('AlbumFeatureExtension', () => {
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1280
     * @tc.name    AlbumExtension1280
     * @tc.desc    Font size grows with the breakpoint from small to large
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'fontOf_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('sm')).assertEqual(ALBUM_FONT_SM);
      expect(model.fontOf('md')).assertEqual(ALBUM_FONT_MD);
      expect(model.fontOf('lg')).assertEqual(ALBUM_FONT_LG);
      expect(model.fontOf('sm') < model.fontOf('lg')).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1281
     * @tc.name    AlbumExtension1281
     * @tc.desc    Unknown breakpoints fall back to the medium font size
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'fontOf_002', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('xs')).assertEqual(ALBUM_FONT_MD);
      expect(model.fontOf('')).assertEqual(ALBUM_FONT_MD);
      expect(model.fontOf('SM')).assertEqual(ALBUM_FONT_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1282
     * @tc.name    AlbumExtension1282
     * @tc.desc    Cover margin grows with the breakpoint from small to large
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'marginOf_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.marginOf('sm')).assertEqual(ALBUM_MARGIN_SM);
      expect(model.marginOf('md')).assertEqual(ALBUM_MARGIN_MD);
      expect(model.marginOf('lg')).assertEqual(ALBUM_MARGIN_LG);
      expect(model.marginOf('sm') < model.marginOf('lg')).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1283
     * @tc.name    AlbumExtension1283
     * @tc.desc    Unknown breakpoints fall back to the medium cover margin
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'marginOf_002', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.marginOf('tablet')).assertEqual(ALBUM_MARGIN_MD);
      expect(model.marginOf('')).assertEqual(ALBUM_MARGIN_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1284
     * @tc.name    AlbumExtension1284
     * @tc.desc    Font size table is monotonic from small to large
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'isFontMonotonic_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.isFontMonotonic()).assertTrue();
      expect(ALBUM_FONT_SM <= ALBUM_FONT_MD).assertTrue();
      expect(ALBUM_FONT_MD <= ALBUM_FONT_LG).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1285
     * @tc.name    AlbumExtension1285
     * @tc.desc    Cover margin table is monotonic from small to large
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'isMarginMonotonic_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.isMarginMonotonic()).assertTrue();
      expect(ALBUM_MARGIN_SM <= ALBUM_MARGIN_MD).assertTrue();
      expect(ALBUM_MARGIN_MD <= ALBUM_MARGIN_LG).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1286
     * @tc.name    AlbumExtension1286
     * @tc.desc    Track count matches the shared album constant
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getTrackCount_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackCount()).assertEqual(ALBUM_TRACK_COUNT);
      expect(model.getTracks().length).assertEqual(ALBUM_TRACK_COUNT);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1287
     * @tc.name    AlbumExtension1287
     * @tc.desc    Track accessor reuses the same backing array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getTracks_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks() === model.getTracks()).assertTrue();
      expect(model.getTracks()[0] === model.getTrackById(model.getTracks()[0].id)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1288
     * @tc.name    AlbumExtension1288
     * @tc.desc    Album keeps the known gap where track twenty two is missing
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'hasMissingId_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.hasMissingId()).assertTrue();
      expect(model.getTrackById(ALBUM_MISSING_ID) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1289
     * @tc.name    AlbumExtension1289
     * @tc.desc    All generated track identifiers are unique
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'hasUniqueIds_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.hasUniqueIds()).assertTrue();
      const ids: number[] = [];
      model.getTracks().forEach((track: AlbumTrack) => {
        ids.push(track.id);
      });
      expect(ids.indexOf(ALBUM_MISSING_ID)).assertEqual(-1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1290
     * @tc.name    AlbumExtension1290
     * @tc.desc    Identifiers following the gap are shifted by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getTrackById_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const afterGap: AlbumTrack | undefined = model.getTrackById(ALBUM_MISSING_ID + 1);
      expect(afterGap !== undefined).assertTrue();
      expect((afterGap as AlbumTrack).id).assertEqual(ALBUM_MISSING_ID + 1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1291
     * @tc.name    AlbumExtension1291
     * @tc.desc    Last track identifier stays inside the shifted sequence
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getTrackById_002', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackById(ALBUM_TRACK_COUNT + 1) !== undefined).assertTrue();
      expect(model.getTrackById(ALBUM_TRACK_COUNT + 2) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1292
     * @tc.name    AlbumExtension1292
     * @tc.desc    Track lookup rejects zero and negative identifiers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getTrackById_003', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackById(0) === undefined).assertTrue();
      expect(model.getTrackById(-1) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1293
     * @tc.name    AlbumExtension1293
     * @tc.desc    VIP track count matches the every sixth track labelling rule
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'countVip_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.countVip()).assertEqual(4);
      let manual: number = 0;
      model.getTracks().forEach((track: AlbumTrack) => {
        if (track.label === 'ic_vip') {
          manual++;
        }
      });
      expect(model.countVip()).assertEqual(manual);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1294
     * @tc.name    AlbumExtension1294
     * @tc.desc    Non VIP tracks carry the standard quality label
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'labelCheck_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackCount() - model.countVip()).assertEqual(20);
      model.getTracks().forEach((track: AlbumTrack) => {
        expect(track.label === 'ic_vip' || track.label === 'ic_SQ').assertTrue();
      });
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1295
     * @tc.name    AlbumExtension1295
     * @tc.desc    Singer count reflects the five distinct generated singers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'singerCount_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.singerCount()).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1296
     * @tc.name    AlbumExtension1296
     * @tc.desc    Option count matches the shared option constant
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getOptionCount_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getOptionCount()).assertEqual(ALBUM_OPTION_COUNT);
      expect(model.getOptions().length).assertEqual(ALBUM_OPTION_COUNT);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1297
     * @tc.name    AlbumExtension1297
     * @tc.desc    Options are exposed in collect, download, comment, share order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getOptions_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const options: AlbumOption[] = model.getOptions();
      expect(options[0].key).assertEqual('collect');
      expect(options[1].key).assertEqual('download');
      expect(options[2].key).assertEqual('comment');
      expect(options[3].key).assertEqual('share');
      expect(options[0].text).assertEqual('999+');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1298
     * @tc.name    AlbumExtension1298
     * @tc.desc    Track titles use the one based generated pattern
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'trackTitles_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const tracks: AlbumTrack[] = model.getTracks();
      expect(tracks[0].title).assertEqual('track1');
      expect(tracks[tracks.length - 1].title).assertEqual('track' + String(ALBUM_TRACK_COUNT));
      expect(tracks[0].title === tracks[1].title).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1299
     * @tc.name    AlbumExtension1299
     * @tc.desc    First page exposes a full page in album order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'slicePage_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const first: AlbumTrack[] = model.slicePage(0, 10);
      expect(first.length).assertEqual(10);
      expect(first[0].id).assertEqual(1);
      expect(first[9].id).assertEqual(10);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1300
     * @tc.name    AlbumExtension1300
     * @tc.desc    Last page exposes only the remaining tracks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'slicePage_002', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(2, 10).length).assertEqual(4);
      expect(model.slicePage(1, 10)[0].title).assertEqual('track11');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1301
     * @tc.name    AlbumExtension1301
     * @tc.desc    A page beyond the last index yields an empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'slicePage_003', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(3, 10).length).assertEqual(0);
      expect(model.slicePage(ALBUM_TRACK_COUNT, 10).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1302
     * @tc.name    AlbumExtension1302
     * @tc.desc    Page count guards non positive page sizes
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'totalPages_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(0)).assertEqual(0);
      expect(model.totalPages(-3)).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1303
     * @tc.name    AlbumExtension1303
     * @tc.desc    Page count rounds partial pages and honours oversized page sizes
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'totalPages_002', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(1)).assertEqual(ALBUM_TRACK_COUNT);
      expect(model.totalPages(7)).assertEqual(4);
      expect(model.totalPages(ALBUM_TRACK_COUNT)).assertEqual(1);
      expect(model.totalPages(ALBUM_TRACK_COUNT + 1)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1304
     * @tc.name    AlbumExtension1304
     * @tc.desc    Constructor copies the caller array so later pushes stay local
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'constructor_001', 0, () => {
      const local: SongItem[] = [makeTrack(1, 'first')];
      const source: MyDataSource = new MyDataSource(local);
      local.push(makeTrack(2, 'second'));
      expect(source.totalCount()).assertEqual(1);
      expect(local.length).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1305
     * @tc.name    AlbumExtension1305
     * @tc.desc    Constructor keeps item references so later field changes are visible
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'constructor_002', 0, () => {
      const local: SongItem[] = [makeTrack(1, 'before')];
      const source: MyDataSource = new MyDataSource(local);
      local[0].title = 'after';
      expect(source.getData(0).title).assertEqual('after');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1306
     * @tc.name    AlbumExtension1306
     * @tc.desc    Inserting directly after the last index appends the track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'addData_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      source.addData(2, makeTrack(3, 'c'));
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(2).title).assertEqual('c');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1307
     * @tc.name    AlbumExtension1307
     * @tc.desc    Inserting in the middle shifts only the following tracks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'addData_002', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b'), makeTrack(3, 'c')]);
      source.addData(1, makeTrack(9, 'x'));
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(0).title).assertEqual('a');
      expect(source.getData(1).title).assertEqual('x');
      expect(source.getData(2).title).assertEqual('b');
      expect(source.getData(3).title).assertEqual('c');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1308
     * @tc.name    AlbumExtension1308
     * @tc.desc    Negative index inserts the track before the final element
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'addData_003', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b'), makeTrack(3, 'c')]);
      source.addData(-1, makeTrack(9, 'x'));
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(2).title).assertEqual('x');
      expect(source.getData(3).title).assertEqual('c');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1309
     * @tc.name    AlbumExtension1309
     * @tc.desc    Appended track keeps object identity with the caller payload
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pushData_001', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      const track: SongItem = makeTrack(7, 'seven');
      source.pushData(track);
      expect(source.getData(0) === track).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1310
     * @tc.name    AlbumExtension1310
     * @tc.desc    Every registered listener receives an append notification
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'listeners_001', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      const log: string[] = [];
      const first: AlbumListener = new AlbumListener('first', log);
      const second: AlbumListener = new AlbumListener('second', log);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.pushData(makeTrack(1, 'a'));
      expect(first.addCount).assertEqual(1);
      expect(second.addCount).assertEqual(1);
      expect(second.lastAddIndex).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1311
     * @tc.name    AlbumExtension1311
     * @tc.desc    Listeners are notified in registration order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'listeners_002', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      const log: string[] = [];
      const first: AlbumListener = new AlbumListener('first', log);
      const second: AlbumListener = new AlbumListener('second', log);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.pushData(makeTrack(1, 'a'));
      expect(log.length).assertEqual(2);
      expect(log[0]).assertEqual('first:add');
      expect(log[1]).assertEqual('second:add');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1312
     * @tc.name    AlbumExtension1312
     * @tc.desc    Removing one listener leaves the remaining listener active
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'listeners_003', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      const log: string[] = [];
      const first: AlbumListener = new AlbumListener('first', log);
      const second: AlbumListener = new AlbumListener('second', log);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.pushData(makeTrack(1, 'a'));
      expect(first.addCount).assertEqual(0);
      expect(second.addCount).assertEqual(1);
      expect(log.length).assertEqual(1);
      expect(log[0]).assertEqual('second:add');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1313
     * @tc.name    AlbumExtension1313
     * @tc.desc    Listener registered after existing data is not replayed
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'listeners_004', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const log: string[] = [];
      const listener: AlbumListener = new AlbumListener('late', log);
      source.registerDataChangeListener(listener);
      expect(listener.addCount).assertEqual(0);
      expect(log.length).assertEqual(0);
      source.pushData(makeTrack(2, 'b'));
      expect(listener.addCount).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1314
     * @tc.name    AlbumExtension1314
     * @tc.desc    Reload notification reaches every registered listener
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notify_001', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      const log: string[] = [];
      const first: AlbumListener = new AlbumListener('first', log);
      const second: AlbumListener = new AlbumListener('second', log);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataReload();
      expect(first.reloadCount).assertEqual(1);
      expect(second.reloadCount).assertEqual(1);
      expect(log.length).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1315
     * @tc.name    AlbumExtension1315
     * @tc.desc    Option text may be either a literal string or a resource reference
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'optionList_001', 0, () => {
      expect(typeof optionList[0].text).assertEqual('string');
      expect((optionList[0].text as string)).assertEqual('999+');
      expect(typeof optionList[1].text === 'string').assertFalse();
      expect((optionList[1].text as Resource).id > 0).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1316
     * @tc.name    AlbumExtension1316
     * @tc.desc    Source song list exposes twenty four tracks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListCount_001', 0, () => {
      expect(songList.length).assertEqual(24);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1317
     * @tc.name    AlbumExtension1317
     * @tc.desc    Source list starts at one and ends at twenty five
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListFirstLast_001', 0, () => {
      const firstTrack: SongItem = songList[0];
      const lastTrack: SongItem = songList[23];
      expect(firstTrack.id).assertEqual(1);
      expect(lastTrack.id).assertEqual(25);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1318
     * @tc.name    AlbumExtension1318
     * @tc.desc    Source list skips identifier twenty two
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListGap_001', 0, () => {
      const ids: Set<number> = new Set<number>();
      for (let i = 0; i < songList.length; i++) {
        ids.add(songList[i].id);
      }
      expect(ids.size).assertEqual(24);
      expect(ids.has(22)).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1319
     * @tc.name    AlbumExtension1319
     * @tc.desc    Source identifiers increase by one around the gap
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListOrder_001', 0, () => {
      for (let i = 1; i < songList.length; i++) {
        const previous: number = songList[i - 1].id;
        const expected: number = previous === 21 ? 23 : previous + 1;
        expect(songList[i].id).assertEqual(expected);
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1320
     * @tc.name    AlbumExtension1320
     * @tc.desc    Source list marks exactly two tracks as VIP
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListVip_001', 0, () => {
      const vipId: number = songList[0].label.id;
      let count: number = 0;
      for (let i = 0; i < songList.length; i++) {
        if (songList[i].label.id === vipId) {
          count++;
        }
      }
      expect(count).assertEqual(2);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1321
     * @tc.name    AlbumExtension1321
     * @tc.desc    Remaining source tracks carry the standard label
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListQuality_001', 0, () => {
      const vipId: number = songList[0].label.id;
      const sqId: number = songList[1].label.id;
      expect(sqId === vipId).assertFalse();
      let count: number = 0;
      for (let i = 0; i < songList.length; i++) {
        if (songList[i].label.id === sqId) {
          count++;
        }
      }
      expect(count).assertEqual(22);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1322
     * @tc.name    AlbumExtension1322
     * @tc.desc    Repeated source captions keep the same singer
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListRepeat_001', 0, () => {
      const head: SongItem = songList[0];
      const twin: SongItem = songList[11];
      expect(head.title).assertEqual(twin.title);
      expect(head.singer).assertEqual(twin.singer);
      const late: SongItem = songList[10];
      expect(late.title).assertEqual(songList[21].title);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1323
     * @tc.name    AlbumExtension1323
     * @tc.desc    Distinct source titles are fewer than the track count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListDuplicateTitles_001', 0, () => {
      const titles: Set<string> = new Set<string>();
      for (let i = 0; i < songList.length; i++) {
        titles.add(songList[i].title);
      }
      expect(titles.size < songList.length).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1324
     * @tc.name    AlbumExtension1324
     * @tc.desc    Every source track carries non empty text fields
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListFields_001', 0, () => {
      for (let i = 0; i < songList.length; i++) {
        expect(typeof songList[i].title).assertEqual('string');
        expect(songList[i].title.length > 0).assertTrue();
        expect(songList[i].singer.length > 0).assertTrue();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1325
     * @tc.name    AlbumExtension1325
     * @tc.desc    Source label resources resolve to positive identifiers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListLabels_001', 0, () => {
      for (let i = 0; i < songList.length; i++) {
        expect(songList[i].label.id > 0).assertTrue();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1326
     * @tc.name    AlbumExtension1326
     * @tc.desc    Source list uses exactly two label resources
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListLabelSet_001', 0, () => {
      const ids: Set<number> = new Set<number>();
      for (let i = 0; i < songList.length; i++) {
        ids.add(songList[i].label.id);
      }
      expect(ids.size).assertEqual(2);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1327
     * @tc.name    AlbumExtension1327
     * @tc.desc    Every action option owns a distinct icon resource
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'optionImages_001', 0, () => {
      const ids: Set<number> = new Set<number>();
      for (let i = 0; i < optionList.length; i++) {
        expect(optionList[i].image.id > 0).assertTrue();
        ids.add(optionList[i].image.id);
      }
      expect(ids.size).assertEqual(optionList.length);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1328
     * @tc.name    AlbumExtension1328
     * @tc.desc    Only the collect option uses a literal caption
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'optionTextKinds_001', 0, () => {
      expect(typeof optionList[0].text).assertEqual('string');
      expect(typeof optionList[1].text === 'string').assertFalse();
      expect(typeof optionList[2].text === 'string').assertFalse();
      expect(typeof optionList[3].text === 'string').assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1329
     * @tc.name    AlbumExtension1329
     * @tc.desc    Remaining action captions resolve to resources
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'optionResources_001', 0, () => {
      for (let i = 1; i < optionList.length; i++) {
        expect((optionList[i].text as Resource).id > 0).assertTrue();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1330
     * @tc.name    AlbumExtension1330
     * @tc.desc    Change notification reaches every listener
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyChange_001', 0, () => {
      const source: MyDataSource = new MyDataSource(songList.slice(0, 2));
      const first: AlbumListener = new AlbumListener('first', []);
      const second: AlbumListener = new AlbumListener('second', []);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataChange(1);
      expect(first.changeCount).assertEqual(1);
      expect(second.changeCount).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1331
     * @tc.name    AlbumExtension1331
     * @tc.desc    Delete notification reaches every listener
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyDelete_001', 0, () => {
      const source: MyDataSource = new MyDataSource(songList.slice(0, 2));
      const first: AlbumListener = new AlbumListener('first', []);
      const second: AlbumListener = new AlbumListener('second', []);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataDelete(0);
      expect(first.deleteCount).assertEqual(1);
      expect(second.deleteCount).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1332
     * @tc.name    AlbumExtension1332
     * @tc.desc    Move notification preserves both positions
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyMove_001', 0, () => {
      const source: MyDataSource = new MyDataSource(songList.slice(0, 3));
      const listener: AlbumListener = new AlbumListener('move', []);
      source.registerDataChangeListener(listener);
      source.notifyDataMove(1, 3);
      expect(listener.moveCount).assertEqual(1);
      expect(listener.lastMoveFrom).assertEqual(1);
      expect(listener.lastMoveTo).assertEqual(3);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1333
     * @tc.name    AlbumExtension1333
     * @tc.desc    Mixed notifications keep one counter per call
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyMixed_001', 0, () => {
      const source: MyDataSource = new MyDataSource(songList.slice(0, 2));
      const listener: AlbumListener = new AlbumListener('mixed', []);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataChange(0);
      source.notifyDataDelete(0);
      source.notifyDataMove(0, 1);
      source.notifyDataAdd(0);
      expect(listener.reloadCount).assertEqual(1);
      expect(listener.changeCount).assertEqual(1);
      expect(listener.deleteCount).assertEqual(1);
      expect(listener.moveCount).assertEqual(1);
      expect(listener.addCount).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1334
     * @tc.name    AlbumExtension1334
     * @tc.desc    Notifying without listeners keeps the data unchanged
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'notifyNoListener_001', 0, () => {
      const source: MyDataSource = new MyDataSource(songList.slice(0, 2));
      source.notifyDataReload();
      source.notifyDataChange(0);
      source.notifyDataDelete(0);
      source.notifyDataMove(0, 1);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).id).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1335
     * @tc.name    AlbumExtension1335
     * @tc.desc    Pushing the same track twice keeps two sharing entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'duplicatePush_001', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      const track: SongItem = makeTrack(1, 'same');
      source.pushData(track);
      source.pushData(track);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0) === source.getData(1)).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1336
     * @tc.name    AlbumExtension1336
     * @tc.desc    Negative index inserts the track before the last one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'addNegativeIndex_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      source.addData(-1, makeTrack(3, 'x'));
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(0).title).assertEqual('a');
      expect(source.getData(1).title).assertEqual('x');
      expect(source.getData(2).title).assertEqual('b');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1337
     * @tc.name    AlbumExtension1337
     * @tc.desc    Insertion at the current length appends the track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'addAtLength_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      source.addData(2, makeTrack(3, 'x'));
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(2).title).assertEqual('x');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1338
     * @tc.name    AlbumExtension1338
     * @tc.desc    Insertion beyond the current length appends at the end
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'addBeyondLength_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      source.addData(9, makeTrack(3, 'x'));
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(2).title).assertEqual('x');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1339
     * @tc.name    AlbumExtension1339
     * @tc.desc    Out of range read reports undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'dataOutOfRange_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      const beyond: SongItem | undefined = source.getData(2);
      const before: SongItem | undefined = source.getData(-1);
      expect(beyond === undefined).assertTrue();
      expect(before === undefined).assertTrue();
      expect(source.totalCount()).assertEqual(2);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1340
     * @tc.name    AlbumExtension1340
     * @tc.desc    Empty constructor starts with zero tracks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'emptySource_001', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      expect(source.totalCount()).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1341
     * @tc.name    AlbumExtension1341
     * @tc.desc    Push into an empty source notifies index zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'emptyPush_001', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      const listener: AlbumListener = new AlbumListener('empty', []);
      source.registerDataChangeListener(listener);
      source.pushData(makeTrack(1, 'a'));
      expect(source.totalCount()).assertEqual(1);
      expect(listener.addCount).assertEqual(1);
      expect(listener.lastAddIndex).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1342
     * @tc.name    AlbumExtension1342
     * @tc.desc    Three listeners are notified in registration order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'listenerOrderThree_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const log: string[] = [];
      source.registerDataChangeListener(new AlbumListener('a', log));
      source.registerDataChangeListener(new AlbumListener('b', log));
      source.registerDataChangeListener(new AlbumListener('c', log));
      source.pushData(makeTrack(2, 'b'));
      expect(log.length).assertEqual(3);
      expect(log[0]).assertEqual('a:add');
      expect(log[1]).assertEqual('b:add');
      expect(log[2]).assertEqual('c:add');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1343
     * @tc.name    AlbumExtension1343
     * @tc.desc    Track mutation changes VIP count and singer count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'trackMutation_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const beforeVip: number = model.countVip();
      const beforeSinger: number = model.singerCount();
      model.getTracks()[0].label = 'ic_vip';
      model.getTracks()[1].singer = 'brand-new';
      expect(model.countVip()).assertEqual(beforeVip + 1);
      expect(model.singerCount()).assertEqual(beforeSinger + 1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1344
     * @tc.name    AlbumExtension1344
     * @tc.desc    Negative page index yields an empty album page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pageNegative_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(-1, 5).length).assertEqual(0);
      expect(model.slicePage(-3, 30).length).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1345
     * @tc.name    AlbumExtension1345
     * @tc.desc    Sliced album page is a copy of the backing list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pageCopy_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(0, 3);
      page.push({ id: 99, title: 'extra', singer: 'none', label: 'ic_SQ' });
      expect(page.length).assertEqual(4);
      expect(model.getTrackCount()).assertEqual(ALBUM_TRACK_COUNT);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1346
     * @tc.name    AlbumExtension1346
     * @tc.desc    Only the first and the twelfth source tracks are VIP
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sourceVipIndices_001', 0, () => {
      const vipId: number = songList[0].label.id;
      expect(songList[11].label.id).assertEqual(vipId);
      expect(songList[1].label.id === vipId).assertFalse();
      expect(songList[21].label.id === vipId).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1347
     * @tc.name    AlbumExtension1347
     * @tc.desc    Unregistering an unknown listener leaves other listeners active
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'unregisterUnknown_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const active: AlbumListener = new AlbumListener('active', []);
      const stranger: AlbumListener = new AlbumListener('stranger', []);
      source.registerDataChangeListener(active);
      source.unregisterDataChangeListener(stranger);
      source.notifyDataChange(0);
      expect(active.changeCount).assertEqual(1);
      expect(stranger.changeCount).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1348
     * @tc.name    AlbumExtension1348
     * @tc.desc    Sequential pushes report the growing append index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pushIndexSequence_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const listener: AlbumListener = new AlbumListener('push', []);
      source.registerDataChangeListener(listener);
      source.pushData(makeTrack(2, 'b'));
      source.pushData(makeTrack(3, 'c'));
      expect(source.totalCount()).assertEqual(3);
      expect(listener.addCount).assertEqual(2);
      expect(listener.lastAddIndex).assertEqual(2);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1349
     * @tc.name    AlbumExtension1349
     * @tc.desc    Insertion at the front moves the original head to index one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'insertFront_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      source.addData(0, makeTrack(9, 'front'));
      expect(source.getData(0).title).assertEqual('front');
      expect(source.getData(1).title).assertEqual('a');
      expect(source.getData(2).title).assertEqual('b');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1350
     * @tc.name    AlbumExtension1350
     * @tc.desc    Push into a three entry source reports index three
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pushTailIndex_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b'), makeTrack(3, 'c')]);
      const listener: AlbumListener = new AlbumListener('tail', []);
      source.registerDataChangeListener(listener);
      source.pushData(makeTrack(4, 'd'));
      expect(listener.lastAddIndex).assertEqual(3);
      expect(source.getData(3).title).assertEqual('d');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1351
     * @tc.name    AlbumExtension1351
     * @tc.desc    Direct add notification keeps the stored data untouched
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'directAddNotify_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const listener: AlbumListener = new AlbumListener('direct', []);
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(5);
      expect(listener.addCount).assertEqual(1);
      expect(listener.lastAddIndex).assertEqual(5);
      expect(source.totalCount()).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1352
     * @tc.name    AlbumExtension1352
     * @tc.desc    Repeated reads of one index return the same stored object
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'readIdentity_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      expect(source.getData(0) === source.getData(0)).assertTrue();
      expect(source.getData(1).title).assertEqual('b');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1353
     * @tc.name    AlbumExtension1353
     * @tc.desc    Appending a track raises the model count and enables lookup
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'modelPushTrack_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = { id: 99, title: 'extra', singer: 'none', label: 'ic_SQ' };
      model.getTracks().push(track);
      expect(model.getTrackCount()).assertEqual(ALBUM_TRACK_COUNT + 1);
      expect(model.getTrackById(99) === track).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1354
     * @tc.name    AlbumExtension1354
     * @tc.desc    The first identifier after the gap maps to track twenty two
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'idGapFirstAfter_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const first: AlbumTrack | undefined = model.getTrackById(23);
      expect(first !== undefined).assertTrue();
      expect((first as AlbumTrack).title).assertEqual('track22');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1355
     * @tc.name    AlbumExtension1355
     * @tc.desc    The second identifier after the gap maps to track twenty three
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'idGapSecondAfter_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const second: AlbumTrack | undefined = model.getTrackById(24);
      expect(second !== undefined).assertTrue();
      expect((second as AlbumTrack).title).assertEqual('track23');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1356
     * @tc.name    AlbumExtension1356
     * @tc.desc    The final identifier maps to the last generated track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'idFinalTrack_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const last: AlbumTrack | undefined = model.getTrackById(25);
      expect(last !== undefined).assertTrue();
      expect((last as AlbumTrack).title).assertEqual('track24');
      expect((last as AlbumTrack).id).assertEqual(25);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1357
     * @tc.name    AlbumExtension1357
     * @tc.desc    An empty breakpoint falls back to the medium margin
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'marginEmptyFallback_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.marginOf('')).assertEqual(ALBUM_MARGIN_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1358
     * @tc.name    AlbumExtension1358
     * @tc.desc    The large breakpoint uses the published large font
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'fontLargeExact_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('lg')).assertEqual(ALBUM_FONT_LG);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1359
     * @tc.name    AlbumExtension1359
     * @tc.desc    The small breakpoint uses the published small margin
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'marginSmallExact_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.marginOf('sm')).assertEqual(ALBUM_MARGIN_SM);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1360
     * @tc.name    AlbumExtension1360
     * @tc.desc    Appending an option raises the option count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'optionCountAfterPush_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getOptions().push({ key: 'extra', text: 'extra' });
      expect(model.getOptionCount()).assertEqual(ALBUM_OPTION_COUNT + 1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1361
     * @tc.name    AlbumExtension1361
     * @tc.desc    Flipping one label to VIP raises the VIP count to five
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'vipAfterLabelFlip_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[0].label = 'ic_vip';
      expect(model.countVip()).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1362
     * @tc.name    AlbumExtension1362
     * @tc.desc    Collapsing every singer to one name shrinks the singer count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'singerCollapse_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks().forEach((track: AlbumTrack) => {
        track.singer = 'x';
      });
      expect(model.singerCount()).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1363
     * @tc.name    AlbumExtension1363
     * @tc.desc    One page sized like the album returns every track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sliceFullAlbum_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(0, ALBUM_TRACK_COUNT);
      expect(page.length).assertEqual(ALBUM_TRACK_COUNT);
      expect(page[0].title).assertEqual('track1');
      expect(page[ALBUM_TRACK_COUNT - 1].title).assertEqual('track24');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1364
     * @tc.name    AlbumExtension1364
     * @tc.desc    A zero page size returns no album track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sliceZeroSize_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(0, 0).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1365
     * @tc.name    AlbumExtension1365
     * @tc.desc    The second single sized page starts at track two
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sliceSecondSingle_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(1, 1)[0].title).assertEqual('track2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1366
     * @tc.name    AlbumExtension1366
     * @tc.desc    A half track page size yields forty eight pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pagesHalfTrack_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(0.5)).assertEqual(48);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1367
     * @tc.name    AlbumExtension1367
     * @tc.desc    A page size at or above the album yields one page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pagesFullAlbum_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(ALBUM_TRACK_COUNT)).assertEqual(1);
      expect(model.totalPages(ALBUM_TRACK_COUNT + 1)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1368
     * @tc.name    AlbumExtension1368
     * @tc.desc    Duplicating an identifier breaks id uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'uniqueAfterDuplicateId_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[1].id = model.getTracks()[0].id;
      expect(model.hasUniqueIds()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1369
     * @tc.name    AlbumExtension1369
     * @tc.desc    The first track keeps its id, title, singer and standard label
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'firstTrackFields_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[0];
      expect(track.id).assertEqual(1);
      expect(track.title).assertEqual('track1');
      expect(track.singer).assertEqual('singer1');
      expect(track.label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1370
     * @tc.name    AlbumExtension1370
     * @tc.desc    The last track keeps the shifted id and VIP label
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'lastTrackFields_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[23];
      expect(track.id).assertEqual(25);
      expect(track.title).assertEqual('track24');
      expect(track.singer).assertEqual('singer4');
      expect(track.label).assertEqual('ic_vip');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1371
     * @tc.name    AlbumExtension1371
     * @tc.desc    Registering one listener twice still yields one notification
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'duplicateListenerRegistration_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const listener: AlbumListener = new AlbumListener('dup', []);
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.pushData(makeTrack(2, 'b'));
      expect(source.totalCount()).assertEqual(2);
      expect(listener.addCount).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1372
     * @tc.name    AlbumExtension1372
     * @tc.desc    A fractional read index reports undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'fractionalReadUndefined_001', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const got: SongItem | undefined = source.getData(1.5);
      expect(got === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1373
     * @tc.name    AlbumExtension1373
     * @tc.desc    An appended option lands at the next option slot
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'optionKeyAfterPush_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getOptions().push({ key: 'extra', text: 'x' });
      expect(model.getOptions()[ALBUM_OPTION_COUNT].key).assertEqual('extra');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1374
     * @tc.name    AlbumExtension1374
     * @tc.desc    Mixed case breakpoint names fall back to the medium values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'fontUnknownCase_001', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('Md')).assertEqual(ALBUM_FONT_MD);
      expect(model.marginOf('lG')).assertEqual(ALBUM_MARGIN_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1375
     * @tc.name    AlbumExtension1375
     * @tc.desc    Track 1 exposes the shifted identifier 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[0].id).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1376
     * @tc.name    AlbumExtension1376
     * @tc.desc    Track 1 exposes the generated title track1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[0].title).assertEqual('track1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1377
     * @tc.name    AlbumExtension1377
     * @tc.desc    Track 1 exposes the singer singer1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[0].singer).assertEqual('singer1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1378
     * @tc.name    AlbumExtension1378
     * @tc.desc    Track 1 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[0].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1379
     * @tc.name    AlbumExtension1379
     * @tc.desc    Track 1 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[0];
      expect(track.id).assertEqual(1);
      expect(track.title).assertEqual('track1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1380
     * @tc.name    AlbumExtension1380
     * @tc.desc    Identifier 1 resolves back to track 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(1);
      expect(found === model.getTracks()[0]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1381
     * @tc.name    AlbumExtension1381
     * @tc.desc    Track 2 exposes the shifted identifier 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[1].id).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1382
     * @tc.name    AlbumExtension1382
     * @tc.desc    Track 2 exposes the generated title track2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[1].title).assertEqual('track2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1383
     * @tc.name    AlbumExtension1383
     * @tc.desc    Track 2 exposes the singer singer2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[1].singer).assertEqual('singer2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1384
     * @tc.name    AlbumExtension1384
     * @tc.desc    Track 2 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[1].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1385
     * @tc.name    AlbumExtension1385
     * @tc.desc    Track 2 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[1];
      expect(track.id).assertEqual(2);
      expect(track.title).assertEqual('track2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1386
     * @tc.name    AlbumExtension1386
     * @tc.desc    Identifier 2 resolves back to track 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(2);
      expect(found === model.getTracks()[1]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1387
     * @tc.name    AlbumExtension1387
     * @tc.desc    Track 3 exposes the shifted identifier 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[2].id).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1388
     * @tc.name    AlbumExtension1388
     * @tc.desc    Track 3 exposes the generated title track3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[2].title).assertEqual('track3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1389
     * @tc.name    AlbumExtension1389
     * @tc.desc    Track 3 exposes the singer singer3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[2].singer).assertEqual('singer3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1390
     * @tc.name    AlbumExtension1390
     * @tc.desc    Track 3 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[2].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1391
     * @tc.name    AlbumExtension1391
     * @tc.desc    Track 3 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[2];
      expect(track.id).assertEqual(3);
      expect(track.title).assertEqual('track3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1392
     * @tc.name    AlbumExtension1392
     * @tc.desc    Identifier 3 resolves back to track 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(3);
      expect(found === model.getTracks()[2]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1393
     * @tc.name    AlbumExtension1393
     * @tc.desc    Track 4 exposes the shifted identifier 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[3].id).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1394
     * @tc.name    AlbumExtension1394
     * @tc.desc    Track 4 exposes the generated title track4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[3].title).assertEqual('track4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1395
     * @tc.name    AlbumExtension1395
     * @tc.desc    Track 4 exposes the singer singer4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[3].singer).assertEqual('singer4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1396
     * @tc.name    AlbumExtension1396
     * @tc.desc    Track 4 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[3].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1397
     * @tc.name    AlbumExtension1397
     * @tc.desc    Track 4 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[3];
      expect(track.id).assertEqual(4);
      expect(track.title).assertEqual('track4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1398
     * @tc.name    AlbumExtension1398
     * @tc.desc    Identifier 4 resolves back to track 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(4);
      expect(found === model.getTracks()[3]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1399
     * @tc.name    AlbumExtension1399
     * @tc.desc    Track 5 exposes the shifted identifier 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[4].id).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1400
     * @tc.name    AlbumExtension1400
     * @tc.desc    Track 5 exposes the generated title track5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[4].title).assertEqual('track5');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1401
     * @tc.name    AlbumExtension1401
     * @tc.desc    Track 5 exposes the singer singer0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[4].singer).assertEqual('singer0');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1402
     * @tc.name    AlbumExtension1402
     * @tc.desc    Track 5 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[4].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1403
     * @tc.name    AlbumExtension1403
     * @tc.desc    Track 5 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[4];
      expect(track.id).assertEqual(5);
      expect(track.title).assertEqual('track5');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1404
     * @tc.name    AlbumExtension1404
     * @tc.desc    Identifier 5 resolves back to track 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(5);
      expect(found === model.getTracks()[4]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1405
     * @tc.name    AlbumExtension1405
     * @tc.desc    Track 6 exposes the shifted identifier 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id05', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[5].id).assertEqual(6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1406
     * @tc.name    AlbumExtension1406
     * @tc.desc    Track 6 exposes the generated title track6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title05', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[5].title).assertEqual('track6');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1407
     * @tc.name    AlbumExtension1407
     * @tc.desc    Track 6 exposes the singer singer1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer05', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[5].singer).assertEqual('singer1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1408
     * @tc.name    AlbumExtension1408
     * @tc.desc    Track 6 exposes the label ic_vip
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label05', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[5].label).assertEqual('ic_vip');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1409
     * @tc.name    AlbumExtension1409
     * @tc.desc    Track 6 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair05', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[5];
      expect(track.id).assertEqual(6);
      expect(track.title).assertEqual('track6');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1410
     * @tc.name    AlbumExtension1410
     * @tc.desc    Identifier 6 resolves back to track 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find05', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(6);
      expect(found === model.getTracks()[5]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1411
     * @tc.name    AlbumExtension1411
     * @tc.desc    Track 7 exposes the shifted identifier 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id06', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[6].id).assertEqual(7);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1412
     * @tc.name    AlbumExtension1412
     * @tc.desc    Track 7 exposes the generated title track7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title06', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[6].title).assertEqual('track7');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1413
     * @tc.name    AlbumExtension1413
     * @tc.desc    Track 7 exposes the singer singer2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer06', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[6].singer).assertEqual('singer2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1414
     * @tc.name    AlbumExtension1414
     * @tc.desc    Track 7 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label06', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[6].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1415
     * @tc.name    AlbumExtension1415
     * @tc.desc    Track 7 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair06', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[6];
      expect(track.id).assertEqual(7);
      expect(track.title).assertEqual('track7');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1416
     * @tc.name    AlbumExtension1416
     * @tc.desc    Identifier 7 resolves back to track 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find06', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(7);
      expect(found === model.getTracks()[6]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1417
     * @tc.name    AlbumExtension1417
     * @tc.desc    Track 8 exposes the shifted identifier 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id07', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[7].id).assertEqual(8);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1418
     * @tc.name    AlbumExtension1418
     * @tc.desc    Track 8 exposes the generated title track8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title07', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[7].title).assertEqual('track8');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1419
     * @tc.name    AlbumExtension1419
     * @tc.desc    Track 8 exposes the singer singer3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer07', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[7].singer).assertEqual('singer3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1420
     * @tc.name    AlbumExtension1420
     * @tc.desc    Track 8 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label07', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[7].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1421
     * @tc.name    AlbumExtension1421
     * @tc.desc    Track 8 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair07', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[7];
      expect(track.id).assertEqual(8);
      expect(track.title).assertEqual('track8');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1422
     * @tc.name    AlbumExtension1422
     * @tc.desc    Identifier 8 resolves back to track 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find07', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(8);
      expect(found === model.getTracks()[7]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1423
     * @tc.name    AlbumExtension1423
     * @tc.desc    Track 9 exposes the shifted identifier 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id08', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[8].id).assertEqual(9);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1424
     * @tc.name    AlbumExtension1424
     * @tc.desc    Track 9 exposes the generated title track9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title08', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[8].title).assertEqual('track9');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1425
     * @tc.name    AlbumExtension1425
     * @tc.desc    Track 9 exposes the singer singer4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer08', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[8].singer).assertEqual('singer4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1426
     * @tc.name    AlbumExtension1426
     * @tc.desc    Track 9 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label08', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[8].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1427
     * @tc.name    AlbumExtension1427
     * @tc.desc    Track 9 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair08', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[8];
      expect(track.id).assertEqual(9);
      expect(track.title).assertEqual('track9');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1428
     * @tc.name    AlbumExtension1428
     * @tc.desc    Identifier 9 resolves back to track 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find08', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(9);
      expect(found === model.getTracks()[8]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1429
     * @tc.name    AlbumExtension1429
     * @tc.desc    Track 10 exposes the shifted identifier 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id09', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[9].id).assertEqual(10);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1430
     * @tc.name    AlbumExtension1430
     * @tc.desc    Track 10 exposes the generated title track10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title09', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[9].title).assertEqual('track10');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1431
     * @tc.name    AlbumExtension1431
     * @tc.desc    Track 10 exposes the singer singer0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer09', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[9].singer).assertEqual('singer0');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1432
     * @tc.name    AlbumExtension1432
     * @tc.desc    Track 10 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label09', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[9].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1433
     * @tc.name    AlbumExtension1433
     * @tc.desc    Track 10 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair09', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[9];
      expect(track.id).assertEqual(10);
      expect(track.title).assertEqual('track10');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1434
     * @tc.name    AlbumExtension1434
     * @tc.desc    Identifier 10 resolves back to track 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find09', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(10);
      expect(found === model.getTracks()[9]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1435
     * @tc.name    AlbumExtension1435
     * @tc.desc    Track 11 exposes the shifted identifier 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id10', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[10].id).assertEqual(11);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1436
     * @tc.name    AlbumExtension1436
     * @tc.desc    Track 11 exposes the generated title track11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title10', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[10].title).assertEqual('track11');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1437
     * @tc.name    AlbumExtension1437
     * @tc.desc    Track 11 exposes the singer singer1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer10', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[10].singer).assertEqual('singer1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1438
     * @tc.name    AlbumExtension1438
     * @tc.desc    Track 11 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label10', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[10].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1439
     * @tc.name    AlbumExtension1439
     * @tc.desc    Track 11 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair10', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[10];
      expect(track.id).assertEqual(11);
      expect(track.title).assertEqual('track11');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1440
     * @tc.name    AlbumExtension1440
     * @tc.desc    Identifier 11 resolves back to track 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find10', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(11);
      expect(found === model.getTracks()[10]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1441
     * @tc.name    AlbumExtension1441
     * @tc.desc    Track 12 exposes the shifted identifier 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id11', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[11].id).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1442
     * @tc.name    AlbumExtension1442
     * @tc.desc    Track 12 exposes the generated title track12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title11', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[11].title).assertEqual('track12');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1443
     * @tc.name    AlbumExtension1443
     * @tc.desc    Track 12 exposes the singer singer2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer11', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[11].singer).assertEqual('singer2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1444
     * @tc.name    AlbumExtension1444
     * @tc.desc    Track 12 exposes the label ic_vip
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label11', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[11].label).assertEqual('ic_vip');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1445
     * @tc.name    AlbumExtension1445
     * @tc.desc    Track 12 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair11', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[11];
      expect(track.id).assertEqual(12);
      expect(track.title).assertEqual('track12');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1446
     * @tc.name    AlbumExtension1446
     * @tc.desc    Identifier 12 resolves back to track 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find11', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(12);
      expect(found === model.getTracks()[11]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1447
     * @tc.name    AlbumExtension1447
     * @tc.desc    Track 13 exposes the shifted identifier 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id12', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[12].id).assertEqual(13);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1448
     * @tc.name    AlbumExtension1448
     * @tc.desc    Track 13 exposes the generated title track13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title12', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[12].title).assertEqual('track13');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1449
     * @tc.name    AlbumExtension1449
     * @tc.desc    Track 13 exposes the singer singer3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer12', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[12].singer).assertEqual('singer3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1450
     * @tc.name    AlbumExtension1450
     * @tc.desc    Track 13 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label12', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[12].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1451
     * @tc.name    AlbumExtension1451
     * @tc.desc    Track 13 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair12', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[12];
      expect(track.id).assertEqual(13);
      expect(track.title).assertEqual('track13');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1452
     * @tc.name    AlbumExtension1452
     * @tc.desc    Identifier 13 resolves back to track 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find12', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(13);
      expect(found === model.getTracks()[12]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1453
     * @tc.name    AlbumExtension1453
     * @tc.desc    Track 14 exposes the shifted identifier 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id13', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[13].id).assertEqual(14);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1454
     * @tc.name    AlbumExtension1454
     * @tc.desc    Track 14 exposes the generated title track14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title13', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[13].title).assertEqual('track14');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1455
     * @tc.name    AlbumExtension1455
     * @tc.desc    Track 14 exposes the singer singer4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer13', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[13].singer).assertEqual('singer4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1456
     * @tc.name    AlbumExtension1456
     * @tc.desc    Track 14 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label13', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[13].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1457
     * @tc.name    AlbumExtension1457
     * @tc.desc    Track 14 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair13', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[13];
      expect(track.id).assertEqual(14);
      expect(track.title).assertEqual('track14');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1458
     * @tc.name    AlbumExtension1458
     * @tc.desc    Identifier 14 resolves back to track 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find13', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(14);
      expect(found === model.getTracks()[13]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1459
     * @tc.name    AlbumExtension1459
     * @tc.desc    Track 15 exposes the shifted identifier 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id14', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[14].id).assertEqual(15);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1460
     * @tc.name    AlbumExtension1460
     * @tc.desc    Track 15 exposes the generated title track15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title14', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[14].title).assertEqual('track15');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1461
     * @tc.name    AlbumExtension1461
     * @tc.desc    Track 15 exposes the singer singer0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer14', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[14].singer).assertEqual('singer0');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1462
     * @tc.name    AlbumExtension1462
     * @tc.desc    Track 15 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label14', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[14].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1463
     * @tc.name    AlbumExtension1463
     * @tc.desc    Track 15 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair14', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[14];
      expect(track.id).assertEqual(15);
      expect(track.title).assertEqual('track15');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1464
     * @tc.name    AlbumExtension1464
     * @tc.desc    Identifier 15 resolves back to track 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find14', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(15);
      expect(found === model.getTracks()[14]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1465
     * @tc.name    AlbumExtension1465
     * @tc.desc    Track 16 exposes the shifted identifier 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id15', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[15].id).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1466
     * @tc.name    AlbumExtension1466
     * @tc.desc    Track 16 exposes the generated title track16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title15', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[15].title).assertEqual('track16');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1467
     * @tc.name    AlbumExtension1467
     * @tc.desc    Track 16 exposes the singer singer1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer15', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[15].singer).assertEqual('singer1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1468
     * @tc.name    AlbumExtension1468
     * @tc.desc    Track 16 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label15', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[15].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1469
     * @tc.name    AlbumExtension1469
     * @tc.desc    Track 16 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair15', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[15];
      expect(track.id).assertEqual(16);
      expect(track.title).assertEqual('track16');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1470
     * @tc.name    AlbumExtension1470
     * @tc.desc    Identifier 16 resolves back to track 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find15', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(16);
      expect(found === model.getTracks()[15]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1471
     * @tc.name    AlbumExtension1471
     * @tc.desc    Track 17 exposes the shifted identifier 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id16', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[16].id).assertEqual(17);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1472
     * @tc.name    AlbumExtension1472
     * @tc.desc    Track 17 exposes the generated title track17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title16', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[16].title).assertEqual('track17');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1473
     * @tc.name    AlbumExtension1473
     * @tc.desc    Track 17 exposes the singer singer2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer16', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[16].singer).assertEqual('singer2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1474
     * @tc.name    AlbumExtension1474
     * @tc.desc    Track 17 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label16', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[16].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1475
     * @tc.name    AlbumExtension1475
     * @tc.desc    Track 17 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair16', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[16];
      expect(track.id).assertEqual(17);
      expect(track.title).assertEqual('track17');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1476
     * @tc.name    AlbumExtension1476
     * @tc.desc    Identifier 17 resolves back to track 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find16', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(17);
      expect(found === model.getTracks()[16]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1477
     * @tc.name    AlbumExtension1477
     * @tc.desc    Track 18 exposes the shifted identifier 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id17', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[17].id).assertEqual(18);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1478
     * @tc.name    AlbumExtension1478
     * @tc.desc    Track 18 exposes the generated title track18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title17', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[17].title).assertEqual('track18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1479
     * @tc.name    AlbumExtension1479
     * @tc.desc    Track 18 exposes the singer singer3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer17', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[17].singer).assertEqual('singer3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1480
     * @tc.name    AlbumExtension1480
     * @tc.desc    Track 18 exposes the label ic_vip
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label17', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[17].label).assertEqual('ic_vip');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1481
     * @tc.name    AlbumExtension1481
     * @tc.desc    Track 18 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair17', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[17];
      expect(track.id).assertEqual(18);
      expect(track.title).assertEqual('track18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1482
     * @tc.name    AlbumExtension1482
     * @tc.desc    Identifier 18 resolves back to track 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find17', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(18);
      expect(found === model.getTracks()[17]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1483
     * @tc.name    AlbumExtension1483
     * @tc.desc    Track 19 exposes the shifted identifier 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id18', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[18].id).assertEqual(19);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1484
     * @tc.name    AlbumExtension1484
     * @tc.desc    Track 19 exposes the generated title track19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title18', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[18].title).assertEqual('track19');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1485
     * @tc.name    AlbumExtension1485
     * @tc.desc    Track 19 exposes the singer singer4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer18', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[18].singer).assertEqual('singer4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1486
     * @tc.name    AlbumExtension1486
     * @tc.desc    Track 19 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label18', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[18].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1487
     * @tc.name    AlbumExtension1487
     * @tc.desc    Track 19 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair18', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[18];
      expect(track.id).assertEqual(19);
      expect(track.title).assertEqual('track19');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1488
     * @tc.name    AlbumExtension1488
     * @tc.desc    Identifier 19 resolves back to track 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find18', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(19);
      expect(found === model.getTracks()[18]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1489
     * @tc.name    AlbumExtension1489
     * @tc.desc    Track 20 exposes the shifted identifier 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id19', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[19].id).assertEqual(20);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1490
     * @tc.name    AlbumExtension1490
     * @tc.desc    Track 20 exposes the generated title track20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title19', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[19].title).assertEqual('track20');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1491
     * @tc.name    AlbumExtension1491
     * @tc.desc    Track 20 exposes the singer singer0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer19', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[19].singer).assertEqual('singer0');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1492
     * @tc.name    AlbumExtension1492
     * @tc.desc    Track 20 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label19', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[19].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1493
     * @tc.name    AlbumExtension1493
     * @tc.desc    Track 20 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair19', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[19];
      expect(track.id).assertEqual(20);
      expect(track.title).assertEqual('track20');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1494
     * @tc.name    AlbumExtension1494
     * @tc.desc    Identifier 20 resolves back to track 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find19', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(20);
      expect(found === model.getTracks()[19]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1495
     * @tc.name    AlbumExtension1495
     * @tc.desc    Track 21 exposes the shifted identifier 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id20', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[20].id).assertEqual(21);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1496
     * @tc.name    AlbumExtension1496
     * @tc.desc    Track 21 exposes the generated title track21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title20', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[20].title).assertEqual('track21');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1497
     * @tc.name    AlbumExtension1497
     * @tc.desc    Track 21 exposes the singer singer1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer20', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[20].singer).assertEqual('singer1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1498
     * @tc.name    AlbumExtension1498
     * @tc.desc    Track 21 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label20', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[20].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1499
     * @tc.name    AlbumExtension1499
     * @tc.desc    Track 21 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair20', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[20];
      expect(track.id).assertEqual(21);
      expect(track.title).assertEqual('track21');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1500
     * @tc.name    AlbumExtension1500
     * @tc.desc    Identifier 21 resolves back to track 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find20', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(21);
      expect(found === model.getTracks()[20]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1501
     * @tc.name    AlbumExtension1501
     * @tc.desc    Track 22 exposes the shifted identifier 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id21', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[21].id).assertEqual(23);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1502
     * @tc.name    AlbumExtension1502
     * @tc.desc    Track 22 exposes the generated title track22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title21', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[21].title).assertEqual('track22');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1503
     * @tc.name    AlbumExtension1503
     * @tc.desc    Track 22 exposes the singer singer2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer21', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[21].singer).assertEqual('singer2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1504
     * @tc.name    AlbumExtension1504
     * @tc.desc    Track 22 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label21', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[21].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1505
     * @tc.name    AlbumExtension1505
     * @tc.desc    Track 22 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair21', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[21];
      expect(track.id).assertEqual(23);
      expect(track.title).assertEqual('track22');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1506
     * @tc.name    AlbumExtension1506
     * @tc.desc    Identifier 23 resolves back to track 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find21', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(23);
      expect(found === model.getTracks()[21]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1507
     * @tc.name    AlbumExtension1507
     * @tc.desc    Track 23 exposes the shifted identifier 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id22', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[22].id).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1508
     * @tc.name    AlbumExtension1508
     * @tc.desc    Track 23 exposes the generated title track23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title22', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[22].title).assertEqual('track23');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1509
     * @tc.name    AlbumExtension1509
     * @tc.desc    Track 23 exposes the singer singer3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer22', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[22].singer).assertEqual('singer3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1510
     * @tc.name    AlbumExtension1510
     * @tc.desc    Track 23 exposes the label ic_SQ
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label22', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[22].label).assertEqual('ic_SQ');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1511
     * @tc.name    AlbumExtension1511
     * @tc.desc    Track 23 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair22', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[22];
      expect(track.id).assertEqual(24);
      expect(track.title).assertEqual('track23');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1512
     * @tc.name    AlbumExtension1512
     * @tc.desc    Identifier 24 resolves back to track 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find22', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(24);
      expect(found === model.getTracks()[22]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1513
     * @tc.name    AlbumExtension1513
     * @tc.desc    Track 24 exposes the shifted identifier 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5id23', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[23].id).assertEqual(25);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1514
     * @tc.name    AlbumExtension1514
     * @tc.desc    Track 24 exposes the generated title track24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5title23', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[23].title).assertEqual('track24');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1515
     * @tc.name    AlbumExtension1515
     * @tc.desc    Track 24 exposes the singer singer4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singer23', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[23].singer).assertEqual('singer4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1516
     * @tc.name    AlbumExtension1516
     * @tc.desc    Track 24 exposes the label ic_vip
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5label23', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTracks()[23].label).assertEqual('ic_vip');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1517
     * @tc.name    AlbumExtension1517
     * @tc.desc    Track 24 keeps the identifier and title pair
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pair23', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const track: AlbumTrack = model.getTracks()[23];
      expect(track.id).assertEqual(25);
      expect(track.title).assertEqual('track24');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1518
     * @tc.name    AlbumExtension1518
     * @tc.desc    Identifier 25 resolves back to track 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5find23', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const found: AlbumTrack | undefined = model.getTrackById(25);
      expect(found === model.getTracks()[23]).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1519
     * @tc.name    AlbumExtension1519
     * @tc.desc    Lookup of invalid identifier 0 returns undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bydge00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackById(0) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1520
     * @tc.name    AlbumExtension1520
     * @tc.desc    Lookup of invalid identifier -1 returns undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bydge01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackById(-1) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1521
     * @tc.name    AlbumExtension1521
     * @tc.desc    Lookup of invalid identifier 22 returns undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bydge02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackById(22) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1522
     * @tc.name    AlbumExtension1522
     * @tc.desc    Lookup of invalid identifier 26 returns undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bydge03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackById(26) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1523
     * @tc.name    AlbumExtension1523
     * @tc.desc    Lookup of invalid identifier 100 returns undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bydge04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackById(100) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1524
     * @tc.name    AlbumExtension1524
     * @tc.desc    Lookup of invalid identifier 1.5 returns undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bydge05', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackById(1.5) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1525
     * @tc.name    AlbumExtension1525
     * @tc.desc    Lookup of valid identifier 1 returns a track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bydge06', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackById(1) !== undefined).assertTrue();
      expect((model.getTrackById(1) as AlbumTrack).id).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1526
     * @tc.name    AlbumExtension1526
     * @tc.desc    Lookup of valid identifier 21 returns a track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bydge07', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackById(21) !== undefined).assertTrue();
      expect((model.getTrackById(21) as AlbumTrack).id).assertEqual(21);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1527
     * @tc.name    AlbumExtension1527
     * @tc.desc    Lookup of valid identifier 23 returns a track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bydge08', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackById(23) !== undefined).assertTrue();
      expect((model.getTrackById(23) as AlbumTrack).id).assertEqual(23);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1528
     * @tc.name    AlbumExtension1528
     * @tc.desc    Lookup of valid identifier 25 returns a track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5bydge09', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackById(25) !== undefined).assertTrue();
      expect((model.getTrackById(25) as AlbumTrack).id).assertEqual(25);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1529
     * @tc.name    AlbumExtension1529
     * @tc.desc    Single track page 0 returns track 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(0, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1530
     * @tc.name    AlbumExtension1530
     * @tc.desc    Single track page 1 returns track 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(1, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1531
     * @tc.name    AlbumExtension1531
     * @tc.desc    Single track page 2 returns track 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(2, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1532
     * @tc.name    AlbumExtension1532
     * @tc.desc    Single track page 3 returns track 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(3, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1533
     * @tc.name    AlbumExtension1533
     * @tc.desc    Single track page 4 returns track 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(4, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track5');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1534
     * @tc.name    AlbumExtension1534
     * @tc.desc    Single track page 5 returns track 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl05', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(5, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track6');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1535
     * @tc.name    AlbumExtension1535
     * @tc.desc    Single track page 6 returns track 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl06', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(6, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track7');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1536
     * @tc.name    AlbumExtension1536
     * @tc.desc    Single track page 7 returns track 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl07', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(7, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track8');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1537
     * @tc.name    AlbumExtension1537
     * @tc.desc    Single track page 8 returns track 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl08', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(8, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track9');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1538
     * @tc.name    AlbumExtension1538
     * @tc.desc    Single track page 9 returns track 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl09', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(9, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track10');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1539
     * @tc.name    AlbumExtension1539
     * @tc.desc    Single track page 10 returns track 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl10', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(10, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track11');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1540
     * @tc.name    AlbumExtension1540
     * @tc.desc    Single track page 11 returns track 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl11', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(11, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track12');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1541
     * @tc.name    AlbumExtension1541
     * @tc.desc    Single track page 12 returns track 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl12', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(12, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track13');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1542
     * @tc.name    AlbumExtension1542
     * @tc.desc    Single track page 13 returns track 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl13', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(13, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track14');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1543
     * @tc.name    AlbumExtension1543
     * @tc.desc    Single track page 14 returns track 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl14', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(14, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track15');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1544
     * @tc.name    AlbumExtension1544
     * @tc.desc    Single track page 15 returns track 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl15', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(15, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track16');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1545
     * @tc.name    AlbumExtension1545
     * @tc.desc    Single track page 16 returns track 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl16', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(16, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track17');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1546
     * @tc.name    AlbumExtension1546
     * @tc.desc    Single track page 17 returns track 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl17', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(17, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1547
     * @tc.name    AlbumExtension1547
     * @tc.desc    Single track page 18 returns track 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl18', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(18, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track19');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1548
     * @tc.name    AlbumExtension1548
     * @tc.desc    Single track page 19 returns track 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl19', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(19, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track20');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1549
     * @tc.name    AlbumExtension1549
     * @tc.desc    Single track page 20 returns track 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl20', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(20, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track21');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1550
     * @tc.name    AlbumExtension1550
     * @tc.desc    Single track page 21 returns track 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl21', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(21, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track22');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1551
     * @tc.name    AlbumExtension1551
     * @tc.desc    Single track page 22 returns track 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl22', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(22, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track23');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1552
     * @tc.name    AlbumExtension1552
     * @tc.desc    Single track page 23 returns track 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl23', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(23, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('track24');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1553
     * @tc.name    AlbumExtension1553
     * @tc.desc    Page 0 of size 2 returns 2 tracks starting at track1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg2_00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(0, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('track1');
      expect(page[page.length - 1].title).assertEqual('track2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1554
     * @tc.name    AlbumExtension1554
     * @tc.desc    Page 1 of size 2 returns 2 tracks starting at track3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg2_01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(1, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('track3');
      expect(page[page.length - 1].title).assertEqual('track4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1555
     * @tc.name    AlbumExtension1555
     * @tc.desc    Page 2 of size 2 returns 2 tracks starting at track5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg2_02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(2, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('track5');
      expect(page[page.length - 1].title).assertEqual('track6');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1556
     * @tc.name    AlbumExtension1556
     * @tc.desc    Page 3 of size 2 returns 2 tracks starting at track7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg2_03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(3, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('track7');
      expect(page[page.length - 1].title).assertEqual('track8');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1557
     * @tc.name    AlbumExtension1557
     * @tc.desc    Page 4 of size 2 returns 2 tracks starting at track9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg2_04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(4, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('track9');
      expect(page[page.length - 1].title).assertEqual('track10');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1558
     * @tc.name    AlbumExtension1558
     * @tc.desc    Page 5 of size 2 returns 2 tracks starting at track11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg2_05', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(5, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('track11');
      expect(page[page.length - 1].title).assertEqual('track12');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1559
     * @tc.name    AlbumExtension1559
     * @tc.desc    Page 6 of size 2 returns 2 tracks starting at track13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg2_06', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(6, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('track13');
      expect(page[page.length - 1].title).assertEqual('track14');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1560
     * @tc.name    AlbumExtension1560
     * @tc.desc    Page 7 of size 2 returns 2 tracks starting at track15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg2_07', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(7, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('track15');
      expect(page[page.length - 1].title).assertEqual('track16');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1561
     * @tc.name    AlbumExtension1561
     * @tc.desc    Page 8 of size 2 returns 2 tracks starting at track17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg2_08', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(8, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('track17');
      expect(page[page.length - 1].title).assertEqual('track18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1562
     * @tc.name    AlbumExtension1562
     * @tc.desc    Page 9 of size 2 returns 2 tracks starting at track19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg2_09', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(9, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('track19');
      expect(page[page.length - 1].title).assertEqual('track20');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1563
     * @tc.name    AlbumExtension1563
     * @tc.desc    Page 10 of size 2 returns 2 tracks starting at track21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg2_10', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(10, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('track21');
      expect(page[page.length - 1].title).assertEqual('track22');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1564
     * @tc.name    AlbumExtension1564
     * @tc.desc    Page 11 of size 2 returns 2 tracks starting at track23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg2_11', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(11, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('track23');
      expect(page[page.length - 1].title).assertEqual('track24');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1565
     * @tc.name    AlbumExtension1565
     * @tc.desc    Page 0 of size 3 returns 3 tracks starting at track1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg3_00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(0, 3);
      expect(page.length).assertEqual(3);
      expect(page[0].title).assertEqual('track1');
      expect(page[page.length - 1].title).assertEqual('track3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1566
     * @tc.name    AlbumExtension1566
     * @tc.desc    Page 1 of size 3 returns 3 tracks starting at track4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg3_01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(1, 3);
      expect(page.length).assertEqual(3);
      expect(page[0].title).assertEqual('track4');
      expect(page[page.length - 1].title).assertEqual('track6');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1567
     * @tc.name    AlbumExtension1567
     * @tc.desc    Page 2 of size 3 returns 3 tracks starting at track7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg3_02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(2, 3);
      expect(page.length).assertEqual(3);
      expect(page[0].title).assertEqual('track7');
      expect(page[page.length - 1].title).assertEqual('track9');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1568
     * @tc.name    AlbumExtension1568
     * @tc.desc    Page 3 of size 3 returns 3 tracks starting at track10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg3_03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(3, 3);
      expect(page.length).assertEqual(3);
      expect(page[0].title).assertEqual('track10');
      expect(page[page.length - 1].title).assertEqual('track12');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1569
     * @tc.name    AlbumExtension1569
     * @tc.desc    Page 4 of size 3 returns 3 tracks starting at track13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg3_04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(4, 3);
      expect(page.length).assertEqual(3);
      expect(page[0].title).assertEqual('track13');
      expect(page[page.length - 1].title).assertEqual('track15');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1570
     * @tc.name    AlbumExtension1570
     * @tc.desc    Page 5 of size 3 returns 3 tracks starting at track16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg3_05', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(5, 3);
      expect(page.length).assertEqual(3);
      expect(page[0].title).assertEqual('track16');
      expect(page[page.length - 1].title).assertEqual('track18');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1571
     * @tc.name    AlbumExtension1571
     * @tc.desc    Page 6 of size 3 returns 3 tracks starting at track19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg3_06', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(6, 3);
      expect(page.length).assertEqual(3);
      expect(page[0].title).assertEqual('track19');
      expect(page[page.length - 1].title).assertEqual('track21');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1572
     * @tc.name    AlbumExtension1572
     * @tc.desc    Page 7 of size 3 returns 3 tracks starting at track22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg3_07', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(7, 3);
      expect(page.length).assertEqual(3);
      expect(page[0].title).assertEqual('track22');
      expect(page[page.length - 1].title).assertEqual('track24');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1573
     * @tc.name    AlbumExtension1573
     * @tc.desc    Page 0 of size 4 returns 4 tracks starting at track1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg4_00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(0, 4);
      expect(page.length).assertEqual(4);
      expect(page[0].title).assertEqual('track1');
      expect(page[page.length - 1].title).assertEqual('track4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1574
     * @tc.name    AlbumExtension1574
     * @tc.desc    Page 1 of size 4 returns 4 tracks starting at track5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg4_01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(1, 4);
      expect(page.length).assertEqual(4);
      expect(page[0].title).assertEqual('track5');
      expect(page[page.length - 1].title).assertEqual('track8');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1575
     * @tc.name    AlbumExtension1575
     * @tc.desc    Page 2 of size 4 returns 4 tracks starting at track9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg4_02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(2, 4);
      expect(page.length).assertEqual(4);
      expect(page[0].title).assertEqual('track9');
      expect(page[page.length - 1].title).assertEqual('track12');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1576
     * @tc.name    AlbumExtension1576
     * @tc.desc    Page 3 of size 4 returns 4 tracks starting at track13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg4_03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(3, 4);
      expect(page.length).assertEqual(4);
      expect(page[0].title).assertEqual('track13');
      expect(page[page.length - 1].title).assertEqual('track16');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1577
     * @tc.name    AlbumExtension1577
     * @tc.desc    Page 4 of size 4 returns 4 tracks starting at track17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg4_04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(4, 4);
      expect(page.length).assertEqual(4);
      expect(page[0].title).assertEqual('track17');
      expect(page[page.length - 1].title).assertEqual('track20');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1578
     * @tc.name    AlbumExtension1578
     * @tc.desc    Page 5 of size 4 returns 4 tracks starting at track21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg4_05', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(5, 4);
      expect(page.length).assertEqual(4);
      expect(page[0].title).assertEqual('track21');
      expect(page[page.length - 1].title).assertEqual('track24');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1579
     * @tc.name    AlbumExtension1579
     * @tc.desc    Page 0 of size 5 returns 5 tracks starting at track1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg5_00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(0, 5);
      expect(page.length).assertEqual(5);
      expect(page[0].title).assertEqual('track1');
      expect(page[page.length - 1].title).assertEqual('track5');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1580
     * @tc.name    AlbumExtension1580
     * @tc.desc    Page 1 of size 5 returns 5 tracks starting at track6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg5_01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(1, 5);
      expect(page.length).assertEqual(5);
      expect(page[0].title).assertEqual('track6');
      expect(page[page.length - 1].title).assertEqual('track10');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1581
     * @tc.name    AlbumExtension1581
     * @tc.desc    Page 2 of size 5 returns 5 tracks starting at track11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg5_02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(2, 5);
      expect(page.length).assertEqual(5);
      expect(page[0].title).assertEqual('track11');
      expect(page[page.length - 1].title).assertEqual('track15');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1582
     * @tc.name    AlbumExtension1582
     * @tc.desc    Page 3 of size 5 returns 5 tracks starting at track16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg5_03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(3, 5);
      expect(page.length).assertEqual(5);
      expect(page[0].title).assertEqual('track16');
      expect(page[page.length - 1].title).assertEqual('track20');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1583
     * @tc.name    AlbumExtension1583
     * @tc.desc    Page 4 of size 5 returns 4 tracks starting at track21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sg5_04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(4, 5);
      expect(page.length).assertEqual(4);
      expect(page[0].title).assertEqual('track21');
      expect(page[page.length - 1].title).assertEqual('track24');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1584
     * @tc.name    AlbumExtension1584
     * @tc.desc    Page size 1 yields 24 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(1)).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1585
     * @tc.name    AlbumExtension1585
     * @tc.desc    Page size 2 yields 12 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(2)).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1586
     * @tc.name    AlbumExtension1586
     * @tc.desc    Page size 3 yields 8 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(3)).assertEqual(8);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1587
     * @tc.name    AlbumExtension1587
     * @tc.desc    Page size 4 yields 6 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(4)).assertEqual(6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1588
     * @tc.name    AlbumExtension1588
     * @tc.desc    Page size 5 yields 5 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg05', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(5)).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1589
     * @tc.name    AlbumExtension1589
     * @tc.desc    Page size 6 yields 4 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg06', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(6)).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1590
     * @tc.name    AlbumExtension1590
     * @tc.desc    Page size 7 yields 4 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg07', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(7)).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1591
     * @tc.name    AlbumExtension1591
     * @tc.desc    Page size 8 yields 3 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg08', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(8)).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1592
     * @tc.name    AlbumExtension1592
     * @tc.desc    Page size 9 yields 3 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg09', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(9)).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1593
     * @tc.name    AlbumExtension1593
     * @tc.desc    Page size 10 yields 3 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg10', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(10)).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1594
     * @tc.name    AlbumExtension1594
     * @tc.desc    Page size 11 yields 3 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg11', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(11)).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1595
     * @tc.name    AlbumExtension1595
     * @tc.desc    Page size 12 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg12', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(12)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1596
     * @tc.name    AlbumExtension1596
     * @tc.desc    Page size 13 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg13', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(13)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1597
     * @tc.name    AlbumExtension1597
     * @tc.desc    Page size 14 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg14', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(14)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1598
     * @tc.name    AlbumExtension1598
     * @tc.desc    Page size 15 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg15', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(15)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1599
     * @tc.name    AlbumExtension1599
     * @tc.desc    Page size 16 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg16', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(16)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1600
     * @tc.name    AlbumExtension1600
     * @tc.desc    Page size 17 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg17', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(17)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1601
     * @tc.name    AlbumExtension1601
     * @tc.desc    Page size 18 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg18', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(18)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1602
     * @tc.name    AlbumExtension1602
     * @tc.desc    Page size 19 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg19', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(19)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1603
     * @tc.name    AlbumExtension1603
     * @tc.desc    Page size 20 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg20', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(20)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1604
     * @tc.name    AlbumExtension1604
     * @tc.desc    Page size 21 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg21', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(21)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1605
     * @tc.name    AlbumExtension1605
     * @tc.desc    Page size 22 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg22', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(22)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1606
     * @tc.name    AlbumExtension1606
     * @tc.desc    Page size 23 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg23', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(23)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1607
     * @tc.name    AlbumExtension1607
     * @tc.desc    Page size 24 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg24', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(24)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1608
     * @tc.name    AlbumExtension1608
     * @tc.desc    Page size 25 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg25', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(25)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1609
     * @tc.name    AlbumExtension1609
     * @tc.desc    Page size 26 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg26', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(26)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1610
     * @tc.name    AlbumExtension1610
     * @tc.desc    Page size 27 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg27', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(27)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1611
     * @tc.name    AlbumExtension1611
     * @tc.desc    Page size 28 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg28', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(28)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1612
     * @tc.name    AlbumExtension1612
     * @tc.desc    Page size 29 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg29', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(29)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1613
     * @tc.name    AlbumExtension1613
     * @tc.desc    Page size 30 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg30', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(30)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1614
     * @tc.name    AlbumExtension1614
     * @tc.desc    Page size 31 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg31', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(31)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1615
     * @tc.name    AlbumExtension1615
     * @tc.desc    Page size 32 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg32', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(32)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1616
     * @tc.name    AlbumExtension1616
     * @tc.desc    Page size 33 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg33', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(33)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1617
     * @tc.name    AlbumExtension1617
     * @tc.desc    Page size 34 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg34', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(34)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1618
     * @tc.name    AlbumExtension1618
     * @tc.desc    Page size 35 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg35', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(35)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1619
     * @tc.name    AlbumExtension1619
     * @tc.desc    Page size 36 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg36', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(36)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1620
     * @tc.name    AlbumExtension1620
     * @tc.desc    Page size 37 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg37', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(37)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1621
     * @tc.name    AlbumExtension1621
     * @tc.desc    Page size 38 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg38', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(38)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1622
     * @tc.name    AlbumExtension1622
     * @tc.desc    Page size 39 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg39', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(39)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1623
     * @tc.name    AlbumExtension1623
     * @tc.desc    Page size 40 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg40', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(40)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1624
     * @tc.name    AlbumExtension1624
     * @tc.desc    Page size 41 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg41', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(41)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1625
     * @tc.name    AlbumExtension1625
     * @tc.desc    Page size 42 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg42', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(42)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1626
     * @tc.name    AlbumExtension1626
     * @tc.desc    Page size 43 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg43', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(43)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1627
     * @tc.name    AlbumExtension1627
     * @tc.desc    Page size 44 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg44', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(44)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1628
     * @tc.name    AlbumExtension1628
     * @tc.desc    Page size 45 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg45', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(45)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1629
     * @tc.name    AlbumExtension1629
     * @tc.desc    Page size 46 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg46', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(46)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1630
     * @tc.name    AlbumExtension1630
     * @tc.desc    Page size 47 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg47', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(47)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1631
     * @tc.name    AlbumExtension1631
     * @tc.desc    Page size 48 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pg48', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(48)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1632
     * @tc.name    AlbumExtension1632
     * @tc.desc    Breakpoint sm returns font 14 and margin 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5font_sm', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('sm')).assertEqual(14);
      expect(model.marginOf('sm')).assertEqual(10);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1633
     * @tc.name    AlbumExtension1633
     * @tc.desc    Breakpoint md returns font 16 and margin 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5font_md', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('md')).assertEqual(16);
      expect(model.marginOf('md')).assertEqual(30);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1634
     * @tc.name    AlbumExtension1634
     * @tc.desc    Breakpoint lg returns font 18 and margin 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5font_lg', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('lg')).assertEqual(18);
      expect(model.marginOf('lg')).assertEqual(40);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1635
     * @tc.name    AlbumExtension1635
     * @tc.desc    Breakpoint variant 1 falls back to the medium values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5fontfb0', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('SM')).assertEqual(ALBUM_FONT_MD);
      expect(model.marginOf('SM')).assertEqual(ALBUM_MARGIN_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1636
     * @tc.name    AlbumExtension1636
     * @tc.desc    Breakpoint variant 2 falls back to the medium values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5fontfb1', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('Md')).assertEqual(ALBUM_FONT_MD);
      expect(model.marginOf('Md')).assertEqual(ALBUM_MARGIN_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1637
     * @tc.name    AlbumExtension1637
     * @tc.desc    Breakpoint variant 3 falls back to the medium values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5fontfb2', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('lG')).assertEqual(ALBUM_FONT_MD);
      expect(model.marginOf('lG')).assertEqual(ALBUM_MARGIN_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1638
     * @tc.name    AlbumExtension1638
     * @tc.desc    Breakpoint variant 4 falls back to the medium values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5fontfb3', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('')).assertEqual(ALBUM_FONT_MD);
      expect(model.marginOf('')).assertEqual(ALBUM_MARGIN_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1639
     * @tc.name    AlbumExtension1639
     * @tc.desc    Breakpoint variant 5 falls back to the medium values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5fontfb4', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('small')).assertEqual(ALBUM_FONT_MD);
      expect(model.marginOf('small')).assertEqual(ALBUM_MARGIN_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1640
     * @tc.name    AlbumExtension1640
     * @tc.desc    Breakpoint variant 6 falls back to the medium values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5fontfb5', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('medium')).assertEqual(ALBUM_FONT_MD);
      expect(model.marginOf('medium')).assertEqual(ALBUM_MARGIN_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1641
     * @tc.name    AlbumExtension1641
     * @tc.desc    Breakpoint variant 7 falls back to the medium values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5fontfb6', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf(' xl')).assertEqual(ALBUM_FONT_MD);
      expect(model.marginOf(' xl')).assertEqual(ALBUM_MARGIN_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1642
     * @tc.name    AlbumExtension1642
     * @tc.desc    Breakpoint variant 8 falls back to the medium values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5fontfb7', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.fontOf('lg ')).assertEqual(ALBUM_FONT_MD);
      expect(model.marginOf('lg ')).assertEqual(ALBUM_MARGIN_MD);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1643
     * @tc.name    AlbumExtension1643
     * @tc.desc    Font and margin scales are monotonic
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5mono', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.isFontMonotonic()).assertTrue();
      expect(model.isMarginMonotonic()).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1644
     * @tc.name    AlbumExtension1644
     * @tc.desc    Option 1 keeps its key
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5optkey0', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getOptions()[0].key.length > 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1645
     * @tc.name    AlbumExtension1645
     * @tc.desc    Option 1 keeps its caption
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5opttext0', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getOptions()[0].text.length > 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1646
     * @tc.name    AlbumExtension1646
     * @tc.desc    Option 2 keeps its key
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5optkey1', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getOptions()[1].key.length > 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1647
     * @tc.name    AlbumExtension1647
     * @tc.desc    Option 2 keeps its caption
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5opttext1', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getOptions()[1].text.length > 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1648
     * @tc.name    AlbumExtension1648
     * @tc.desc    Option 3 keeps its key
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5optkey2', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getOptions()[2].key.length > 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1649
     * @tc.name    AlbumExtension1649
     * @tc.desc    Option 3 keeps its caption
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5opttext2', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getOptions()[2].text.length > 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1650
     * @tc.name    AlbumExtension1650
     * @tc.desc    Option 4 keeps its key
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5optkey3', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getOptions()[3].key.length > 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1651
     * @tc.name    AlbumExtension1651
     * @tc.desc    Option 4 keeps its caption
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5opttext3', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getOptions()[3].text.length > 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1652
     * @tc.name    AlbumExtension1652
     * @tc.desc    Appending an option grows the option list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5optpush', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getOptions().push({ key: 'share2', text: 'again' });
      expect(model.getOptionCount()).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1653
     * @tc.name    AlbumExtension1653
     * @tc.desc    Popping the share option leaves three options
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5optpop', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getOptions().pop();
      expect(model.getOptionCount()).assertEqual(3);
      expect(model.getOptions()[2].key).assertEqual('comment');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1654
     * @tc.name    AlbumExtension1654
     * @tc.desc    Flipping track 2 to VIP raises the VIP count by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5vip01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[1].label = 'ic_vip';
      expect(model.countVip()).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1655
     * @tc.name    AlbumExtension1655
     * @tc.desc    Flipping track 3 to VIP raises the VIP count by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5vip02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[2].label = 'ic_vip';
      expect(model.countVip()).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1656
     * @tc.name    AlbumExtension1656
     * @tc.desc    Flipping track 4 to VIP raises the VIP count by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5vip03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[3].label = 'ic_vip';
      expect(model.countVip()).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1657
     * @tc.name    AlbumExtension1657
     * @tc.desc    Flipping track 5 to VIP raises the VIP count by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5vip04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[4].label = 'ic_vip';
      expect(model.countVip()).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1658
     * @tc.name    AlbumExtension1658
     * @tc.desc    Flipping track 6 to VIP raises the VIP count by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5vip05', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[5].label = 'ic_vip';
      expect(model.countVip()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1659
     * @tc.name    AlbumExtension1659
     * @tc.desc    Flipping track 7 to VIP raises the VIP count by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5vip06', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[6].label = 'ic_vip';
      expect(model.countVip()).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1660
     * @tc.name    AlbumExtension1660
     * @tc.desc    Flipping track 8 to VIP raises the VIP count by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5vip07', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[7].label = 'ic_vip';
      expect(model.countVip()).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1661
     * @tc.name    AlbumExtension1661
     * @tc.desc    Flipping track 9 to VIP raises the VIP count by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5vip08', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[8].label = 'ic_vip';
      expect(model.countVip()).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1662
     * @tc.name    AlbumExtension1662
     * @tc.desc    Flipping track 10 to VIP raises the VIP count by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5vip09', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[9].label = 'ic_vip';
      expect(model.countVip()).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1663
     * @tc.name    AlbumExtension1663
     * @tc.desc    Flipping track 11 to VIP raises the VIP count by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5vip10', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[10].label = 'ic_vip';
      expect(model.countVip()).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1664
     * @tc.name    AlbumExtension1664
     * @tc.desc    Flipping track 12 to VIP raises the VIP count by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5vip11', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[11].label = 'ic_vip';
      expect(model.countVip()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1665
     * @tc.name    AlbumExtension1665
     * @tc.desc    Merging singer0 into singer1 lowers the singer count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singers_singer0', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks().forEach((track: AlbumTrack) => {
        if (track.singer === 'singer0') {
          track.singer = 'singer1';
        }
      });
      expect(model.singerCount()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1666
     * @tc.name    AlbumExtension1666
     * @tc.desc    Merging singer1 into singer2 lowers the singer count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singers_singer1', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks().forEach((track: AlbumTrack) => {
        if (track.singer === 'singer1') {
          track.singer = 'singer2';
        }
      });
      expect(model.singerCount()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1667
     * @tc.name    AlbumExtension1667
     * @tc.desc    Merging singer3 into singer4 lowers the singer count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singers_singer3', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks().forEach((track: AlbumTrack) => {
        if (track.singer === 'singer3') {
          track.singer = 'singer4';
        }
      });
      expect(model.singerCount()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1668
     * @tc.name    AlbumExtension1668
     * @tc.desc    Collapsing every singer to one name yields one singer
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5singersame', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks().forEach((track: AlbumTrack) => {
        track.singer = 'same';
      });
      expect(model.singerCount()).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1669
     * @tc.name    AlbumExtension1669
     * @tc.desc    Duplicating identifier at track 3 breaks uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dup02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[2].id = model.getTracks()[0].id;
      expect(model.hasUniqueIds()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1670
     * @tc.name    AlbumExtension1670
     * @tc.desc    Duplicating identifier at track 4 breaks uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dup03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      model.getTracks()[3].id = model.getTracks()[0].id;
      expect(model.hasUniqueIds()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1671
     * @tc.name    AlbumExtension1671
     * @tc.desc    The seeded identifiers stay unique
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dupok', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.hasUniqueIds()).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1672
     * @tc.name    AlbumExtension1672
     * @tc.desc    The seeded album holds four VIP tracks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5vipbase', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.countVip()).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1673
     * @tc.name    AlbumExtension1673
     * @tc.desc    The album skips identifier twenty two
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5missing', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.hasMissingId()).assertTrue();
      expect(ALBUM_MISSING_ID).assertEqual(22);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1674
     * @tc.name    AlbumExtension1674
     * @tc.desc    The album holds twenty four tracks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5count', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.getTrackCount()).assertEqual(ALBUM_TRACK_COUNT);
      expect(ALBUM_TRACK_COUNT).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1675
     * @tc.name    AlbumExtension1675
     * @tc.desc    Constant ALBUM_FONT_SM keeps the value 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5constfontSm', 0, () => {
      expect(ALBUM_FONT_SM).assertEqual(14);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1676
     * @tc.name    AlbumExtension1676
     * @tc.desc    Constant ALBUM_FONT_MD keeps the value 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5constfontMd', 0, () => {
      expect(ALBUM_FONT_MD).assertEqual(16);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1677
     * @tc.name    AlbumExtension1677
     * @tc.desc    Constant ALBUM_FONT_LG keeps the value 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5constfontLg', 0, () => {
      expect(ALBUM_FONT_LG).assertEqual(18);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1678
     * @tc.name    AlbumExtension1678
     * @tc.desc    Constant ALBUM_MARGIN_SM keeps the value 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5constmarginSm', 0, () => {
      expect(ALBUM_MARGIN_SM).assertEqual(10);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1679
     * @tc.name    AlbumExtension1679
     * @tc.desc    Constant ALBUM_MARGIN_MD keeps the value 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5constmarginMd', 0, () => {
      expect(ALBUM_MARGIN_MD).assertEqual(30);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1680
     * @tc.name    AlbumExtension1680
     * @tc.desc    Constant ALBUM_MARGIN_LG keeps the value 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5constmarginLg', 0, () => {
      expect(ALBUM_MARGIN_LG).assertEqual(40);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1681
     * @tc.name    AlbumExtension1681
     * @tc.desc    Constant ALBUM_OPTION_COUNT keeps the value 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5constoptionCount', 0, () => {
      expect(ALBUM_OPTION_COUNT).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1682
     * @tc.name    AlbumExtension1682
     * @tc.desc    The data source copies the initial element list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsCopy', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).id).assertEqual(1);
      expect(source.getData(1).title).assertEqual('b');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1683
     * @tc.name    AlbumExtension1683
     * @tc.desc    Reading index 0 returns the stored track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsGet0', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b'), makeTrack(3, 'c')]);
      expect(source.getData(0).id).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1684
     * @tc.name    AlbumExtension1684
     * @tc.desc    Reading index 1 returns the stored track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsGet1', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b'), makeTrack(3, 'c')]);
      expect(source.getData(1).id).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1685
     * @tc.name    AlbumExtension1685
     * @tc.desc    Reading index 2 returns the stored track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsGet2', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b'), makeTrack(3, 'c')]);
      expect(source.getData(2).id).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1686
     * @tc.name    AlbumExtension1686
     * @tc.desc    Reading the out of range index -1 yields undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsOut_neg', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b'), makeTrack(3, 'c')]);
      expect(source.getData(-1) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1687
     * @tc.name    AlbumExtension1687
     * @tc.desc    Reading the out of range index 3 yields undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsOut_len', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b'), makeTrack(3, 'c')]);
      expect(source.getData(3) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1688
     * @tc.name    AlbumExtension1688
     * @tc.desc    Reading the out of range index 99 yields undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsOut_big', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b'), makeTrack(3, 'c')]);
      expect(source.getData(99) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1689
     * @tc.name    AlbumExtension1689
     * @tc.desc    Pushing 1 tracks raises the count accordingly
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsPush1', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let k = 0; k < 1; k++) {
        source.pushData(makeTrack(k + 1, 'p' + String(k)));
      }
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0).id).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1690
     * @tc.name    AlbumExtension1690
     * @tc.desc    Pushing 2 tracks raises the count accordingly
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsPush2', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let k = 0; k < 2; k++) {
        source.pushData(makeTrack(k + 1, 'p' + String(k)));
      }
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(1).id).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1691
     * @tc.name    AlbumExtension1691
     * @tc.desc    Pushing 3 tracks raises the count accordingly
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsPush3', 0, () => {
      const source: MyDataSource = new MyDataSource([]);
      for (let k = 0; k < 3; k++) {
        source.pushData(makeTrack(k + 1, 'p' + String(k)));
      }
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(2).id).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1692
     * @tc.name    AlbumExtension1692
     * @tc.desc    Adding a track at index 0 keeps the order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsAdd_head', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      source.addData(0, makeTrack(9, 'x'));
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(0).id).assertEqual(9);
      expect(source.getData(1).id).assertEqual(1);
      expect(source.getData(2).id).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1693
     * @tc.name    AlbumExtension1693
     * @tc.desc    Adding a track at index 1 keeps the order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsAdd_mid', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      source.addData(1, makeTrack(9, 'x'));
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(1).id).assertEqual(9);
      expect(source.getData(0).id).assertEqual(1);
      expect(source.getData(2).id).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1694
     * @tc.name    AlbumExtension1694
     * @tc.desc    Adding a track at index 2 keeps the order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsAdd_tail', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      source.addData(2, makeTrack(9, 'x'));
      expect(source.totalCount()).assertEqual(3);
      expect(source.getData(2).id).assertEqual(9);
      expect(source.getData(0).id).assertEqual(1);
      expect(source.getData(1).id).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1695
     * @tc.name    AlbumExtension1695
     * @tc.desc    A registered listener receives the push callback once
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsListener', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const listener: AlbumListener = new AlbumListener('one', []);
      source.registerDataChangeListener(listener);
      source.pushData(makeTrack(2, 'b'));
      expect(listener.addCount).assertEqual(1);
      expect(listener.lastAddIndex).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1696
     * @tc.name    AlbumExtension1696
     * @tc.desc    Two listeners each receive the push callback
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsTwo', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const first: AlbumListener = new AlbumListener('a', []);
      const second: AlbumListener = new AlbumListener('b', []);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.pushData(makeTrack(2, 'b'));
      expect(first.addCount).assertEqual(1);
      expect(second.addCount).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1697
     * @tc.name    AlbumExtension1697
     * @tc.desc    An unregistered listener stops receiving callbacks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsUnregister', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const listener: AlbumListener = new AlbumListener('one', []);
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.pushData(makeTrack(2, 'b'));
      expect(listener.addCount).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1698
     * @tc.name    AlbumExtension1698
     * @tc.desc    Unregistering an unknown listener is a no-op
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsUnregisterUnknown', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const listener: AlbumListener = new AlbumListener('one', []);
      source.unregisterDataChangeListener(listener);
      source.pushData(makeTrack(2, 'b'));
      expect(source.totalCount()).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1699
     * @tc.name    AlbumExtension1699
     * @tc.desc    A reload notification reaches every listener
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsReload', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const listener: AlbumListener = new AlbumListener('one', []);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      expect(listener.reloadCount).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1700
     * @tc.name    AlbumExtension1700
     * @tc.desc    A change notification reaches a registered listener
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ds_change', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      const listener: AlbumListener = new AlbumListener('one', []);
      source.registerDataChangeListener(listener);
      source.notifyDataChange(0);
      expect(listener.changeCount).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1701
     * @tc.name    AlbumExtension1701
     * @tc.desc    A delete notification reaches a registered listener
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ds_delete', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      const listener: AlbumListener = new AlbumListener('one', []);
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(0);
      expect(listener.deleteCount).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1702
     * @tc.name    AlbumExtension1702
     * @tc.desc    A move notification reaches a registered listener
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5ds_move', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      const listener: AlbumListener = new AlbumListener('one', []);
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 1);
      expect(listener.moveCount).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1703
     * @tc.name    AlbumExtension1703
     * @tc.desc    A move notification forwards both indexes
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsMoveArgs', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a'), makeTrack(2, 'b')]);
      const listener: AlbumListener = new AlbumListener('one', []);
      source.registerDataChangeListener(listener);
      source.notifyDataMove(0, 1);
      expect(listener.lastMoveFrom).assertEqual(0);
      expect(listener.lastMoveTo).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1704
     * @tc.name    AlbumExtension1704
     * @tc.desc    Two notifications append two log entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5dsLog', 0, () => {
      const source: MyDataSource = new MyDataSource([makeTrack(1, 'a')]);
      const listener: AlbumListener = new AlbumListener('one', []);
      source.registerDataChangeListener(listener);
      source.notifyDataChange(0);
      source.notifyDataChange(0);
      expect(listener.log.length).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1705
     * @tc.name    AlbumExtension1705
     * @tc.desc    Page 0 of size 6 keeps 6 tracks starting at 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx6_00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(0, 6);
      expect(page.length).assertEqual(6);
      expect(page[0].title).assertEqual('track1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1706
     * @tc.name    AlbumExtension1706
     * @tc.desc    Page 1 of size 6 keeps 6 tracks starting at 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx6_01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(1, 6);
      expect(page.length).assertEqual(6);
      expect(page[0].title).assertEqual('track7');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1707
     * @tc.name    AlbumExtension1707
     * @tc.desc    Page 2 of size 6 keeps 6 tracks starting at 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx6_02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(2, 6);
      expect(page.length).assertEqual(6);
      expect(page[0].title).assertEqual('track13');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1708
     * @tc.name    AlbumExtension1708
     * @tc.desc    Page 3 of size 6 keeps 6 tracks starting at 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx6_03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(3, 6);
      expect(page.length).assertEqual(6);
      expect(page[0].title).assertEqual('track19');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1709
     * @tc.name    AlbumExtension1709
     * @tc.desc    Page 4 of size 6 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx6_04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(4, 6).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1710
     * @tc.name    AlbumExtension1710
     * @tc.desc    Page 5 of size 6 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx6_05', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(5, 6).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1711
     * @tc.name    AlbumExtension1711
     * @tc.desc    Page 6 of size 6 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx6_06', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(6, 6).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1712
     * @tc.name    AlbumExtension1712
     * @tc.desc    Page 7 of size 6 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx6_07', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(7, 6).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1713
     * @tc.name    AlbumExtension1713
     * @tc.desc    Page 8 of size 6 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx6_08', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(8, 6).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1714
     * @tc.name    AlbumExtension1714
     * @tc.desc    Page 9 of size 6 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx6_09', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(9, 6).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1715
     * @tc.name    AlbumExtension1715
     * @tc.desc    Page 10 of size 6 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx6_10', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(10, 6).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1716
     * @tc.name    AlbumExtension1716
     * @tc.desc    Page 11 of size 6 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx6_11', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(11, 6).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1717
     * @tc.name    AlbumExtension1717
     * @tc.desc    Page 0 of size 8 keeps 8 tracks starting at 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx8_00', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(0, 8);
      expect(page.length).assertEqual(8);
      expect(page[0].title).assertEqual('track1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1718
     * @tc.name    AlbumExtension1718
     * @tc.desc    Page 1 of size 8 keeps 8 tracks starting at 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx8_01', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(1, 8);
      expect(page.length).assertEqual(8);
      expect(page[0].title).assertEqual('track9');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1719
     * @tc.name    AlbumExtension1719
     * @tc.desc    Page 2 of size 8 keeps 8 tracks starting at 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx8_02', 0, () => {
      const model: AlbumModel = new AlbumModel();
      const page: AlbumTrack[] = model.slicePage(2, 8);
      expect(page.length).assertEqual(8);
      expect(page[0].title).assertEqual('track17');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1720
     * @tc.name    AlbumExtension1720
     * @tc.desc    Page 3 of size 8 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx8_03', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(3, 8).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1721
     * @tc.name    AlbumExtension1721
     * @tc.desc    Page 4 of size 8 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx8_04', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(4, 8).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1722
     * @tc.name    AlbumExtension1722
     * @tc.desc    Page 5 of size 8 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx8_05', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(5, 8).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1723
     * @tc.name    AlbumExtension1723
     * @tc.desc    Page 6 of size 8 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx8_06', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(6, 8).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1724
     * @tc.name    AlbumExtension1724
     * @tc.desc    Page 7 of size 8 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx8_07', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(7, 8).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1725
     * @tc.name    AlbumExtension1725
     * @tc.desc    Page 8 of size 8 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx8_08', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(8, 8).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1726
     * @tc.name    AlbumExtension1726
     * @tc.desc    Page 9 of size 8 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx8_09', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(9, 8).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1727
     * @tc.name    AlbumExtension1727
     * @tc.desc    Page 10 of size 8 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx8_10', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(10, 8).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1728
     * @tc.name    AlbumExtension1728
     * @tc.desc    Page 11 of size 8 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sx8_11', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.slicePage(11, 8).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1729
     * @tc.name    AlbumExtension1729
     * @tc.desc    Page size 49 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px49', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(49)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1730
     * @tc.name    AlbumExtension1730
     * @tc.desc    Page size 50 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px50', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(50)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1731
     * @tc.name    AlbumExtension1731
     * @tc.desc    Page size 51 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px51', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(51)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1732
     * @tc.name    AlbumExtension1732
     * @tc.desc    Page size 52 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px52', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(52)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1733
     * @tc.name    AlbumExtension1733
     * @tc.desc    Page size 53 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px53', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(53)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1734
     * @tc.name    AlbumExtension1734
     * @tc.desc    Page size 54 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px54', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(54)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1735
     * @tc.name    AlbumExtension1735
     * @tc.desc    Page size 55 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px55', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(55)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1736
     * @tc.name    AlbumExtension1736
     * @tc.desc    Page size 56 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px56', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(56)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1737
     * @tc.name    AlbumExtension1737
     * @tc.desc    Page size 57 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px57', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(57)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1738
     * @tc.name    AlbumExtension1738
     * @tc.desc    Page size 58 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px58', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(58)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1739
     * @tc.name    AlbumExtension1739
     * @tc.desc    Page size 59 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px59', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(59)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1740
     * @tc.name    AlbumExtension1740
     * @tc.desc    Page size 60 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px60', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(60)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1741
     * @tc.name    AlbumExtension1741
     * @tc.desc    Page size 61 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px61', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(61)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1742
     * @tc.name    AlbumExtension1742
     * @tc.desc    Page size 62 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px62', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(62)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1743
     * @tc.name    AlbumExtension1743
     * @tc.desc    Page size 63 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px63', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(63)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1744
     * @tc.name    AlbumExtension1744
     * @tc.desc    Page size 64 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px64', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(64)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1745
     * @tc.name    AlbumExtension1745
     * @tc.desc    Page size 65 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px65', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(65)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1746
     * @tc.name    AlbumExtension1746
     * @tc.desc    Page size 66 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px66', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(66)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1747
     * @tc.name    AlbumExtension1747
     * @tc.desc    Page size 67 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px67', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(67)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1748
     * @tc.name    AlbumExtension1748
     * @tc.desc    Page size 68 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px68', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(68)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1749
     * @tc.name    AlbumExtension1749
     * @tc.desc    Page size 69 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px69', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(69)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1750
     * @tc.name    AlbumExtension1750
     * @tc.desc    Page size 70 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px70', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(70)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1751
     * @tc.name    AlbumExtension1751
     * @tc.desc    Page size 71 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px71', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(71)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1752
     * @tc.name    AlbumExtension1752
     * @tc.desc    Page size 72 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px72', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(72)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1753
     * @tc.name    AlbumExtension1753
     * @tc.desc    Page size 73 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px73', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(73)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1754
     * @tc.name    AlbumExtension1754
     * @tc.desc    Page size 74 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px74', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(74)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1755
     * @tc.name    AlbumExtension1755
     * @tc.desc    Page size 75 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px75', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(75)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1756
     * @tc.name    AlbumExtension1756
     * @tc.desc    Page size 76 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px76', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(76)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1757
     * @tc.name    AlbumExtension1757
     * @tc.desc    Page size 77 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px77', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(77)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1758
     * @tc.name    AlbumExtension1758
     * @tc.desc    Page size 78 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px78', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(78)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1759
     * @tc.name    AlbumExtension1759
     * @tc.desc    Page size 79 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px79', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(79)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1760
     * @tc.name    AlbumExtension1760
     * @tc.desc    Page size 80 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px80', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(80)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1761
     * @tc.name    AlbumExtension1761
     * @tc.desc    Page size 81 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px81', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(81)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1762
     * @tc.name    AlbumExtension1762
     * @tc.desc    Page size 82 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px82', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(82)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1763
     * @tc.name    AlbumExtension1763
     * @tc.desc    Page size 83 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px83', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(83)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1764
     * @tc.name    AlbumExtension1764
     * @tc.desc    Page size 84 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px84', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(84)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1765
     * @tc.name    AlbumExtension1765
     * @tc.desc    Page size 85 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px85', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(85)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1766
     * @tc.name    AlbumExtension1766
     * @tc.desc    Page size 86 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px86', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(86)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1767
     * @tc.name    AlbumExtension1767
     * @tc.desc    Page size 87 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px87', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(87)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1768
     * @tc.name    AlbumExtension1768
     * @tc.desc    Page size 88 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px88', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(88)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1769
     * @tc.name    AlbumExtension1769
     * @tc.desc    Page size 89 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px89', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(89)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1770
     * @tc.name    AlbumExtension1770
     * @tc.desc    Page size 90 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px90', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(90)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1771
     * @tc.name    AlbumExtension1771
     * @tc.desc    Page size 91 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px91', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(91)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1772
     * @tc.name    AlbumExtension1772
     * @tc.desc    Page size 92 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px92', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(92)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1773
     * @tc.name    AlbumExtension1773
     * @tc.desc    Page size 93 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px93', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(93)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1774
     * @tc.name    AlbumExtension1774
     * @tc.desc    Page size 94 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px94', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(94)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1775
     * @tc.name    AlbumExtension1775
     * @tc.desc    Page size 95 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px95', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(95)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1776
     * @tc.name    AlbumExtension1776
     * @tc.desc    Page size 96 still yields a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5px96', 0, () => {
      const model: AlbumModel = new AlbumModel();
      expect(model.totalPages(96)).assertEqual(1);
    })

  })
}
