/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeEach, TestType, Size, Level } from '@ohos/hypium';
import { readStringByResource, readStringById } from '../../../main/ets/utils/TracedResources';
import { ResourceBoundary } from '../utils/ResourceFakes';
import { InterfaceTestLog } from '../utils/InterfaceTestLog';

export default function ResourceObjectTraceLogic(): void {
  describe('ResourceObjectTraceLogic', (): void => {
    beforeEach(async (): Promise<void> => {
      await new Promise<void>((resolve: () => void): void => {
        setTimeout(resolve, 1);
      });
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0001
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0001
     * @tc.desc Resource routing; success phase; value variant 0; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0001';
      InterfaceTestLog.begin(name, 'Resource; phase=success; variant=0');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8001, type: 10003, params: ['synthetic-0'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "test";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "", message);
      expect(message).assertEqual("");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "test", result);
      expect(result).assertEqual("test");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-0';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-0", retry);
      expect(retry).assertEqual("retry-0");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0002
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0002
     * @tc.desc Resource routing; success phase; value variant 1; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0002';
      InterfaceTestLog.begin(name, 'Resource; phase=success; variant=1');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8019, type: 10003, params: ['synthetic-1'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "text\\path";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "", message);
      expect(message).assertEqual("");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "text\\path", result);
      expect(result).assertEqual("text\\path");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-1';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-1", retry);
      expect(retry).assertEqual("retry-1");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0003
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0003
     * @tc.desc Resource routing; success phase; value variant 2; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0003';
      InterfaceTestLog.begin(name, 'Resource; phase=success; variant=2');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8037, type: 10003, params: ['synthetic-2'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "中文";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "", message);
      expect(message).assertEqual("");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "中文", result);
      expect(result).assertEqual("中文");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-2';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-2", retry);
      expect(retry).assertEqual("retry-2");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0004
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0004
     * @tc.desc Resource routing; success phase; value variant 3; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0004';
      InterfaceTestLog.begin(name, 'Resource; phase=success; variant=3');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8055, type: 10003, params: ['synthetic-3'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "A\nB";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "", message);
      expect(message).assertEqual("");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "A\nB", result);
      expect(result).assertEqual("A\nB");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-3';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-3", retry);
      expect(retry).assertEqual("retry-3");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0005
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0005
     * @tc.desc Resource routing; success phase; value variant 4; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0005';
      InterfaceTestLog.begin(name, 'Resource; phase=success; variant=4');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8073, type: 10003, params: ['synthetic-4'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "​";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "", message);
      expect(message).assertEqual("");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "​", result);
      expect(result).assertEqual("​");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-4';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-4", retry);
      expect(retry).assertEqual("retry-4");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0006
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0006
     * @tc.desc Resource routing; success phase; value variant 5; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0006';
      InterfaceTestLog.begin(name, 'Resource; phase=success; variant=5');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8091, type: 10003, params: ['synthetic-5'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "A\u0000B";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "", message);
      expect(message).assertEqual("");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "A\u0000B", result);
      expect(result).assertEqual("A\u0000B");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-5';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-5", retry);
      expect(retry).assertEqual("retry-5");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0007
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0007
     * @tc.desc Resource routing; success phase; value variant 6; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0007';
      InterfaceTestLog.begin(name, 'Resource; phase=success; variant=6');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8109, type: 10003, params: ['synthetic-6'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "123.45";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "", message);
      expect(message).assertEqual("");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "123.45", result);
      expect(result).assertEqual("123.45");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-6';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-6", retry);
      expect(retry).assertEqual("retry-6");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0008
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0008
     * @tc.desc Resource routing; success phase; value variant 7; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0008';
      InterfaceTestLog.begin(name, 'Resource; phase=success; variant=7');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8127, type: 10003, params: ['synthetic-7'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "value-end";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "", message);
      expect(message).assertEqual("");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "value-end", result);
      expect(result).assertEqual("value-end");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-7';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-7", retry);
      expect(retry).assertEqual("retry-7");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0009
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0009
     * @tc.desc Resource routing; read phase; value variant 0; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0009';
      InterfaceTestLog.begin(name, 'Resource; phase=read; variant=0');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8009, type: 10003, params: ['synthetic-0'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "test";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.readError = 'read-error-0';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "read-error-0", message);
      expect(message).assertEqual("read-error-0");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-0';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-0", retry);
      expect(retry).assertEqual("retry-0");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0010
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0010
     * @tc.desc Resource routing; read phase; value variant 1; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0010';
      InterfaceTestLog.begin(name, 'Resource; phase=read; variant=1');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8027, type: 10003, params: ['synthetic-1'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "text\\path";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.readError = 'read-error-1';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "read-error-1", message);
      expect(message).assertEqual("read-error-1");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-1';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-1", retry);
      expect(retry).assertEqual("retry-1");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0011
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0011
     * @tc.desc Resource routing; read phase; value variant 2; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0011';
      InterfaceTestLog.begin(name, 'Resource; phase=read; variant=2');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8045, type: 10003, params: ['synthetic-2'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "中文";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.readError = 'read-error-2';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "read-error-2", message);
      expect(message).assertEqual("read-error-2");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-2';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-2", retry);
      expect(retry).assertEqual("retry-2");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0012
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0012
     * @tc.desc Resource routing; read phase; value variant 3; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0012';
      InterfaceTestLog.begin(name, 'Resource; phase=read; variant=3');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8063, type: 10003, params: ['synthetic-3'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "A\nB";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.readError = 'read-error-3';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "read-error-3", message);
      expect(message).assertEqual("read-error-3");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-3';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-3", retry);
      expect(retry).assertEqual("retry-3");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0013
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0013
     * @tc.desc Resource routing; read phase; value variant 4; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0013';
      InterfaceTestLog.begin(name, 'Resource; phase=read; variant=4');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8081, type: 10003, params: ['synthetic-4'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "​";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.readError = 'read-error-4';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "read-error-4", message);
      expect(message).assertEqual("read-error-4");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-4';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-4", retry);
      expect(retry).assertEqual("retry-4");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0014
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0014
     * @tc.desc Resource routing; read phase; value variant 5; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0014';
      InterfaceTestLog.begin(name, 'Resource; phase=read; variant=5');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8099, type: 10003, params: ['synthetic-5'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "A\u0000B";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.readError = 'read-error-5';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "read-error-5", message);
      expect(message).assertEqual("read-error-5");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-5';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-5", retry);
      expect(retry).assertEqual("retry-5");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0015
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0015
     * @tc.desc Resource routing; read phase; value variant 6; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0015';
      InterfaceTestLog.begin(name, 'Resource; phase=read; variant=6');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8117, type: 10003, params: ['synthetic-6'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "123.45";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.readError = 'read-error-6';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "read-error-6", message);
      expect(message).assertEqual("read-error-6");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-6';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-6", retry);
      expect(retry).assertEqual("retry-6");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0016
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0016
     * @tc.desc Resource routing; read phase; value variant 7; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0016';
      InterfaceTestLog.begin(name, 'Resource; phase=read; variant=7');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8135, type: 10003, params: ['synthetic-7'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "value-end";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.readError = 'read-error-7';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "read-error-7", message);
      expect(message).assertEqual("read-error-7");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-7';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-7", retry);
      expect(retry).assertEqual("retry-7");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0017
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0017
     * @tc.desc Resource routing; start phase; value variant 0; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0017';
      InterfaceTestLog.begin(name, 'Resource; phase=start; variant=0');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8017, type: 10003, params: ['synthetic-0'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "test";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.startError = 'start-error-0';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "start-error-0", message);
      expect(message).assertEqual("start-error-0");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        0, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(0);
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-0';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-0", retry);
      expect(retry).assertEqual("retry-0");
      InterfaceTestLog.number(name, "Retry adds one read",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0018
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0018
     * @tc.desc Resource routing; start phase; value variant 1; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0018';
      InterfaceTestLog.begin(name, 'Resource; phase=start; variant=1');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8035, type: 10003, params: ['synthetic-1'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "text\\path";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.startError = 'start-error-1';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "start-error-1", message);
      expect(message).assertEqual("start-error-1");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        0, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(0);
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-1';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-1", retry);
      expect(retry).assertEqual("retry-1");
      InterfaceTestLog.number(name, "Retry adds one read",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0019
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0019
     * @tc.desc Resource routing; start phase; value variant 2; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0019';
      InterfaceTestLog.begin(name, 'Resource; phase=start; variant=2');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8053, type: 10003, params: ['synthetic-2'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "中文";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.startError = 'start-error-2';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "start-error-2", message);
      expect(message).assertEqual("start-error-2");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        0, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(0);
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-2';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-2", retry);
      expect(retry).assertEqual("retry-2");
      InterfaceTestLog.number(name, "Retry adds one read",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0020
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0020
     * @tc.desc Resource routing; start phase; value variant 3; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0020';
      InterfaceTestLog.begin(name, 'Resource; phase=start; variant=3');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8071, type: 10003, params: ['synthetic-3'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "A\nB";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.startError = 'start-error-3';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "start-error-3", message);
      expect(message).assertEqual("start-error-3");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        0, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(0);
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-3';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-3", retry);
      expect(retry).assertEqual("retry-3");
      InterfaceTestLog.number(name, "Retry adds one read",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0021
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0021
     * @tc.desc Resource routing; start phase; value variant 4; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0021';
      InterfaceTestLog.begin(name, 'Resource; phase=start; variant=4');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8089, type: 10003, params: ['synthetic-4'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "​";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.startError = 'start-error-4';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "start-error-4", message);
      expect(message).assertEqual("start-error-4");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        0, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(0);
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-4';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-4", retry);
      expect(retry).assertEqual("retry-4");
      InterfaceTestLog.number(name, "Retry adds one read",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0022
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0022
     * @tc.desc Resource routing; start phase; value variant 5; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0022';
      InterfaceTestLog.begin(name, 'Resource; phase=start; variant=5');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8107, type: 10003, params: ['synthetic-5'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "A\u0000B";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.startError = 'start-error-5';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "start-error-5", message);
      expect(message).assertEqual("start-error-5");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        0, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(0);
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-5';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-5", retry);
      expect(retry).assertEqual("retry-5");
      InterfaceTestLog.number(name, "Retry adds one read",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0023
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0023
     * @tc.desc Resource routing; start phase; value variant 6; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0023';
      InterfaceTestLog.begin(name, 'Resource; phase=start; variant=6');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8125, type: 10003, params: ['synthetic-6'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "123.45";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.startError = 'start-error-6';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "start-error-6", message);
      expect(message).assertEqual("start-error-6");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        0, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(0);
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-6';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-6", retry);
      expect(retry).assertEqual("retry-6");
      InterfaceTestLog.number(name, "Retry adds one read",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0024
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0024
     * @tc.desc Resource routing; start phase; value variant 7; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0024';
      InterfaceTestLog.begin(name, 'Resource; phase=start; variant=7');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8143, type: 10003, params: ['synthetic-7'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "value-end";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.startError = 'start-error-7';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "start-error-7", message);
      expect(message).assertEqual("start-error-7");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        0, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(0);
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-7';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-7", retry);
      expect(retry).assertEqual("retry-7");
      InterfaceTestLog.number(name, "Retry adds one read",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|start:getStringSync:1|read|finish" +
        ":getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0025
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0025
     * @tc.desc Resource routing; finish phase; value variant 0; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0025';
      InterfaceTestLog.begin(name, 'Resource; phase=finish; variant=0');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8025, type: 10003, params: ['synthetic-0'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "test";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.finishError = 'finish-error-0';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "finish-error-0", message);
      expect(message).assertEqual("finish-error-0");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-0';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-0", retry);
      expect(retry).assertEqual("retry-0");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0026
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0026
     * @tc.desc Resource routing; finish phase; value variant 1; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0026';
      InterfaceTestLog.begin(name, 'Resource; phase=finish; variant=1');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8043, type: 10003, params: ['synthetic-1'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "text\\path";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.finishError = 'finish-error-1';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "finish-error-1", message);
      expect(message).assertEqual("finish-error-1");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-1';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-1", retry);
      expect(retry).assertEqual("retry-1");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0027
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0027
     * @tc.desc Resource routing; finish phase; value variant 2; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0027';
      InterfaceTestLog.begin(name, 'Resource; phase=finish; variant=2');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8061, type: 10003, params: ['synthetic-2'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "中文";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.finishError = 'finish-error-2';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "finish-error-2", message);
      expect(message).assertEqual("finish-error-2");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-2';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-2", retry);
      expect(retry).assertEqual("retry-2");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0028
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0028
     * @tc.desc Resource routing; finish phase; value variant 3; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0028';
      InterfaceTestLog.begin(name, 'Resource; phase=finish; variant=3');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8079, type: 10003, params: ['synthetic-3'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "A\nB";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.finishError = 'finish-error-3';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "finish-error-3", message);
      expect(message).assertEqual("finish-error-3");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-3';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-3", retry);
      expect(retry).assertEqual("retry-3");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0029
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0029
     * @tc.desc Resource routing; finish phase; value variant 4; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0029';
      InterfaceTestLog.begin(name, 'Resource; phase=finish; variant=4');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8097, type: 10003, params: ['synthetic-4'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "​";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.finishError = 'finish-error-4';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "finish-error-4", message);
      expect(message).assertEqual("finish-error-4");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-4';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-4", retry);
      expect(retry).assertEqual("retry-4");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0030
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0030
     * @tc.desc Resource routing; finish phase; value variant 5; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0030';
      InterfaceTestLog.begin(name, 'Resource; phase=finish; variant=5');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8115, type: 10003, params: ['synthetic-5'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "A\u0000B";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.finishError = 'finish-error-5';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "finish-error-5", message);
      expect(message).assertEqual("finish-error-5");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-5';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-5", retry);
      expect(retry).assertEqual("retry-5");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0031
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0031
     * @tc.desc Resource routing; finish phase; value variant 6; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0031';
      InterfaceTestLog.begin(name, 'Resource; phase=finish; variant=6');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8133, type: 10003, params: ['synthetic-6'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "123.45";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.finishError = 'finish-error-6';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "finish-error-6", message);
      expect(message).assertEqual("finish-error-6");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-6';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-6", retry);
      expect(retry).assertEqual("retry-6");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0032
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0032
     * @tc.desc Resource routing; finish phase; value variant 7; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0032';
      InterfaceTestLog.begin(name, 'Resource; phase=finish; variant=7');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8151, type: 10003, params: ['synthetic-7'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "value-end";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.finishError = 'finish-error-7';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "finish-error-7", message);
      expect(message).assertEqual("finish-error-7");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      boundary.startError = '';
      boundary.readError = '';
      boundary.finishError = '';
      boundary.value = 'retry-7';
      const retry: string = readStringByResource(boundary, resource, boundary);
      InterfaceTestLog.value(name, "Retry uses new resource value",
        "retry-7", retry);
      expect(retry).assertEqual("retry-7");
      InterfaceTestLog.number(name, "Retry adds one read",
        2, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(2);
      InterfaceTestLog.value(name, "Retry has balanced trace",
        "start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1|start" +
        ":getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.flag(name, 'Retry input Resource identity',
        boundary.requests[1] === resource);
      expect(boundary.requests[1] === resource).assertTrue();
      InterfaceTestLog.value(name, "Complete Resource unchanged after retry",
        originalResource, JSON.stringify(resource));
      expect(JSON.stringify(resource)).assertEqual(originalResource);
      InterfaceTestLog.end(name);
    });

    /**
     * @tc.name SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0033
     * @tc.number SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0033
     * @tc.desc Resource routing; read-finish phase; value variant 0; error and retry isolation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      const name: string = 'SUB_REASONABLE_SYSTEM_INTERFACE_LOGIC_RESOURCE_RESOURCE_0033';
      InterfaceTestLog.begin(name, 'Resource; phase=read-finish; variant=0');
      const boundary: ResourceBoundary = new ResourceBoundary();
      const resource: Resource = {
        id: 8033, type: 10003, params: ['synthetic-0'],
        bundleName: 'synthetic.bundle', moduleName: 'entry'
      };
      boundary.value = "test";
      const originalId: number = resource.id;
      const originalParameters: string = JSON.stringify(resource.params);
      const originalResource: string = JSON.stringify(resource);
      boundary.readError = 'read-error-0';
      boundary.finishError = 'finish-error-0';
      let result: string = '<not returned>';
      let message: string = '';
      try {
        result = readStringByResource(boundary, resource, boundary);
      } catch (error) {
        message = (error as Error).message;
      }
      InterfaceTestLog.value(name, "Exact boundary error",
        "finish-error-0", message);
      expect(message).assertEqual("finish-error-0");
      InterfaceTestLog.value(name, "Return only after trace completion",
        "<not returned>", result);
      expect(result).assertEqual("<not returned>");
      InterfaceTestLog.value(name, "Start read finish operation order",
        "start:getStringSync:1|read|finish:getStringSync:1", boundary.events.join("|"));
      expect(boundary.events.join("|")).assertEqual("start:getStringSync:1|read|finish:getStringSync:1");
      InterfaceTestLog.number(name, "Read exactly once after successful trace start",
        1, boundary.requests.length);
      expect(boundary.requests.length).assertEqual(1);
      InterfaceTestLog.flag(name, 'Exact input Resource identity',
        boundary.requests[0] === resource);
      expect(boundary.requests[0] === resource).assertTrue();
      InterfaceTestLog.number(name, "Resource id not mutated",
        originalId, resource.id);
      expect(resource.id).assertEqual(originalId);
      InterfaceTestLog.value(name, "Resource parameters not mutated",
        originalParameters, JSON.stringify(resource.params));
      expect(JSON.stringify(resource.params)).assertEqual(originalParameters);
      InterfaceTestLog.value(name, "Complete Resource not mutated",