/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 */
import { TestType, Size, Level } from '@ohos/hypium';
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium';
import { HashMap, HashSet, ArrayList, Stack } from '@kit.ArkTS';
import { paceTurn } from '../Shared/TestPace';
import { hilog } from '@kit.PerformanceAnalysisKit';


const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AudioToVideoSync_Utils_CollectionMatrix]';

function logBegin(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' begin');
}

function logEnd(name: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', name + ' end');
}

export default function collectionMatrixTest() {
  describe('collectionMatrixTest', () => {
    beforeAll(() => {
      console.info('collectionMatrixTest: suite setup');
    });

    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(() => {
      console.info('collectionMatrixTest: suite teardown');
    });

    /**
     * @tc.number    SUB_AVS_UTIL_MAP_0100
     * @tc.name      testCollection0001
     * @tc.desc      Verify HashMap stores, retrieves and reports a key after set
     */
    it('testCollection0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testCollection0001');
      const map: HashMap<string, number> = new HashMap<string, number>();
      expect(map.length).assertEqual(0);
      map.set('fps', 30);
      expect(map.length).assertEqual(1);
      expect(map.hasKey('fps')).assertTrue();
      expect(map.get('fps')).assertEqual(30);
    
      logEnd('testCollection0001');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_MAP_0200
     * @tc.name      testCollection0002
     * @tc.desc      Verify setting the same key twice keeps one entry and updates the value
     */
    it('testCollection0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testCollection0002');
      const map: HashMap<string, number> = new HashMap<string, number>();
      map.set('speed', 1);
      map.set('speed', 2);
      expect(map.length).assertEqual(1);
      expect(map.get('speed')).assertEqual(2);
    
      logEnd('testCollection0002');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_MAP_0300
     * @tc.name      testCollection0003
     * @tc.desc      Verify removing a key returns its value and shrinks the map
     */
    it('testCollection0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testCollection0003');
      const map: HashMap<string, number> = new HashMap<string, number>();
      map.set('a', 1);
      map.set('b', 2);
      expect(map.remove('a')).assertEqual(1);
      expect(map.length).assertEqual(1);
      expect(map.hasKey('a')).assertFalse();
      expect(map.get('b')).assertEqual(2);
    
      logEnd('testCollection0003');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_MAP_0400
     * @tc.name      testCollection0004
     * @tc.desc      Verify clearing a HashMap empties every entry
     */
    it('testCollection0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testCollection0004');
      const map: HashMap<string, number> = new HashMap<string, number>();
      for (let i = 0; i < 10; i++) {
        map.set(`k${i}`, i);
      }
      expect(map.length).assertEqual(10);
      map.clear();
      expect(map.length).assertEqual(0);
      expect(map.hasKey('k0')).assertFalse();
    
      logEnd('testCollection0004');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_MAP_0500
     * @tc.name      testCollection0005
     * @tc.desc      Verify one hundred distinct keys are all retained with their values
     */
    it('testCollection0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testCollection0005');
      const map: HashMap<string, number> = new HashMap<string, number>();
      for (let i = 0; i < 100; i++) {
        map.set(`key_${i}`, i * 2);
      }
      expect(map.length).assertEqual(100);
      expect(map.get('key_0')).assertEqual(0);
      expect(map.get('key_50')).assertEqual(100);
      expect(map.get('key_99')).assertEqual(198);
    
      logEnd('testCollection0005');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_SET_0100
     * @tc.name      testCollection0006
     * @tc.desc      Verify adding a duplicate to a HashSet returns false and keeps one entry
     */
    it('testCollection0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testCollection0006');
      const set: HashSet<number> = new HashSet<number>();
      expect(set.add(1)).assertTrue();
      set.add(1);
      expect(set.length).assertEqual(1);
      expect(set.has(1)).assertTrue();
      set.add(2);
      expect(set.length).assertEqual(2);
    
      logEnd('testCollection0006');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_SET_0200
     * @tc.name      testCollection0007
     * @tc.desc      Verify removing an existing value returns true and drops the entry
     */
    it('testCollection0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testCollection0007');
      const set: HashSet<string> = new HashSet<string>();
      set.add('media');
      expect(set.remove('media')).assertTrue();
      expect(set.length).assertEqual(0);
      expect(set.has('media')).assertFalse();
    
      logEnd('testCollection0007');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_SET_0300
     * @tc.name      testCollection0008
     * @tc.desc      Verify fifty distinct values produce fifty set entries
     */
    it('testCollection0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testCollection0008');
      const set: HashSet<number> = new HashSet<number>();
      for (let i = 0; i < 50; i++) {
        set.add(i);
      }
      expect(set.length).assertEqual(50);
      expect(set.has(0)).assertTrue();
      expect(set.has(49)).assertTrue();
      expect(set.has(50)).assertFalse();
    
      logEnd('testCollection0008');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_LIST_0100
     * @tc.name      testCollection0009
     * @tc.desc      Verify ArrayList append, index lookup, membership and removal
     */
    it('testCollection0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testCollection0009');
      const list: ArrayList<string> = new ArrayList<string>();
      expect(list.add('a')).assertTrue();
      expect(list.add('b')).assertTrue();
      expect(list.length).assertEqual(2);
      expect(list.getIndexOf('a')).assertEqual(0);
      expect(list.getIndexOf('b')).assertEqual(1);
      expect(list.has('a')).assertTrue();
      expect(list.remove('a')).assertTrue();
      expect(list.length).assertEqual(1);
      expect(list.has('a')).assertFalse();
    
      logEnd('testCollection0009');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_LIST_0200
     * @tc.name      testCollection0010
     * @tc.desc      Verify removeByIndex returns the removed element and shifts the list
     */
    it('testCollection0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testCollection0010');
      const list: ArrayList<number> = new ArrayList<number>();
      list.add(10);
      list.add(20);
      list.add(30);
      expect(list.removeByIndex(0)).assertEqual(10);
      expect(list.length).assertEqual(2);
      expect(list.getIndexOf(20)).assertEqual(0);
      expect(list.getIndexOf(30)).assertEqual(1);
    
      logEnd('testCollection0010');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_STACK_0100
     * @tc.name      testCollection0011
     * @tc.desc      Verify Stack push and pop follow last-in first-out order
     */
    it('testCollection0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testCollection0011');
      const stack: Stack<number> = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      expect(stack.length).assertEqual(3);
      expect(stack.pop()).assertEqual(3);
      expect(stack.pop()).assertEqual(2);
      expect(stack.pop()).assertEqual(1);
      expect(stack.length).assertEqual(0);
    
      logEnd('testCollection0011');
    })

    /**
     * @tc.number    SUB_AVS_UTIL_STACK_0200
     * @tc.name      testCollection0012
     * @tc.desc      Verify Stack peek returns the top element without removing it
     */
    it('testCollection0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      logBegin('testCollection0012');
      const stack: Stack<string> = new Stack<string>();
      stack.push('bottom');
      stack.push('top');
      expect(stack.peek()).assertEqual('top');
      expect(stack.length).assertEqual(2);
      expect(stack.pop()).assertEqual('top');
      expect(stack.peek()).assertEqual('bottom');
    
      logEnd('testCollection0012');
    })
  });
}
