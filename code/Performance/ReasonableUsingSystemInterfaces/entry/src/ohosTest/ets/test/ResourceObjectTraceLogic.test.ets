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