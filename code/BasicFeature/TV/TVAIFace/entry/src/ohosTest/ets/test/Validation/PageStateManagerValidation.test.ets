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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { globalThis } from '../../../../main/ets/common/globalThis';

interface StoredValue {
  name: string;
}


export default function pageStateManagerValidationTest(): void {
  describe('pageStateManagerValidation_test', () => {
    beforeAll(() => {
      // Each case creates its own deterministic fixture.
    });

    afterAll(() => {
      // No shared resources are retained by this suite.
    });

    it('global_store_should_be_a_singleton', 0, () => {
      const first = globalThis.get();
      const second = globalThis.get();
      expect(first === second).assertTrue();
    });

    it('global_store_should_save_and_read_objects', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = {
        name: 'camera-preview'
      };
      store.setObject('aiface-key', value);
      expect(store.getObject('aiface-key') === value).assertTrue();
    });

    it('global_store_should_return_undefined_for_unknown_key', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-key') === undefined).assertTrue();
    });

    it('global_store_apply_should_invoke_callback', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('aiface-callback', () => {
        invoked = true;
      });
      store.apply('aiface-callback');
      expect(invoked).assertTrue();
    });

    it('global_store_apply1_should_forward_argument', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('aiface-callback-value', (value: number) => {
        received = value;
      });
      store.apply1('aiface-callback-value', 42);
      expect(received).assertEqual(42);
    });


    /* Business case 2904-4 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2904', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2904-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2904-4', 3004);
      expect(received).assertEqual(3004);
    });

    /* Business case 2903-3 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2903', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-2903-3', () => {
        invoked = true;
      });
      store.apply('callback-node-2903-3');
      expect(invoked).assertTrue();
    });

    /* Business case 2902-2 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2902', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-2902-2') === undefined).assertTrue();
    });

    /* Business case 2901-1 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2901', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-2901-1' };
      const second: StoredValue = { name: 'second-node-2901-1' };
      store.setObject('overwrite-node-2901-1', first);
      store.setObject('overwrite-node-2901-1', second);
      expect(store.getObject('overwrite-node-2901-1') === second).assertTrue();
    });

    /* Business case 2900-0 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2900', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-2900-0' };
      store.setObject('key-node-2900-0', value);
      expect(store.getObject('key-node-2900-0') === value).assertTrue();
    });

    /* Business case 2899-9 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2899', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2899-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2899-9', 2999);
      expect(received).assertEqual(2999);
    });

    /* Business case 2898-8 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2898', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2898-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2898-8', 2998);
      expect(received).assertEqual(2998);
    });

    /* Business case 2897-7 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2897', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2897-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2897-7', 2997);
      expect(received).assertEqual(2997);
    });

    /* Business case 2896-6 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2896', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2896-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2896-6', 2996);
      expect(received).assertEqual(2996);
    });

    /* Business case 2895-5 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2895', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2895-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2895-5', 2995);
      expect(received).assertEqual(2995);
    });

    /* Business case 2894-4 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2894', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2894-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2894-4', 2994);
      expect(received).assertEqual(2994);
    });

    /* Business case 2893-3 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2893', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-2893-3', () => {
        invoked = true;
      });
      store.apply('callback-node-2893-3');
      expect(invoked).assertTrue();
    });

    /* Business case 2892-2 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2892', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-2892-2') === undefined).assertTrue();
    });

    /* Business case 2891-1 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2891', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-2891-1' };
      const second: StoredValue = { name: 'second-node-2891-1' };
      store.setObject('overwrite-node-2891-1', first);
      store.setObject('overwrite-node-2891-1', second);
      expect(store.getObject('overwrite-node-2891-1') === second).assertTrue();
    });

    /* Business case 2890-0 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2890', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-2890-0' };
      store.setObject('key-node-2890-0', value);
      expect(store.getObject('key-node-2890-0') === value).assertTrue();
    });

    /* Business case 2889-9 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2889', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2889-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2889-9', 2989);
      expect(received).assertEqual(2989);
    });

    /* Business case 2888-8 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2888', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2888-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2888-8', 2988);
      expect(received).assertEqual(2988);
    });

    /* Business case 2887-7 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2887', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2887-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2887-7', 2987);
      expect(received).assertEqual(2987);
    });

    /* Business case 2886-6 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2886', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2886-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2886-6', 2986);
      expect(received).assertEqual(2986);
    });

    /* Business case 2885-5 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2885', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2885-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2885-5', 2985);
      expect(received).assertEqual(2985);
    });

    /* Business case 2884-4 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2884', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2884-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2884-4', 2984);
      expect(received).assertEqual(2984);
    });

    /* Business case 2883-3 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2883', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-2883-3', () => {
        invoked = true;
      });
      store.apply('callback-node-2883-3');
      expect(invoked).assertTrue();
    });

    /* Business case 2882-2 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2882', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-2882-2') === undefined).assertTrue();
    });

    /* Business case 2881-1 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2881', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-2881-1' };
      const second: StoredValue = { name: 'second-node-2881-1' };
      store.setObject('overwrite-node-2881-1', first);
      store.setObject('overwrite-node-2881-1', second);
      expect(store.getObject('overwrite-node-2881-1') === second).assertTrue();
    });

    /* Business case 2880-0 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2880', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-2880-0' };
      store.setObject('key-node-2880-0', value);
      expect(store.getObject('key-node-2880-0') === value).assertTrue();
    });

    /* Business case 2879-9 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2879', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2879-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2879-9', 2979);
      expect(received).assertEqual(2979);
    });

    /* Business case 2878-8 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2878', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2878-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2878-8', 2978);
      expect(received).assertEqual(2978);
    });

    /* Business case 2877-7 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2877', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2877-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2877-7', 2977);
      expect(received).assertEqual(2977);
    });

    /* Business case 2876-6 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2876', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2876-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2876-6', 2976);
      expect(received).assertEqual(2976);
    });

    /* Business case 2875-5 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2875', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2875-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2875-5', 2975);
      expect(received).assertEqual(2975);
    });

    /* Business case 2874-4 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2874', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2874-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2874-4', 2974);
      expect(received).assertEqual(2974);
    });

    /* Business case 2873-3 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2873', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-2873-3', () => {
        invoked = true;
      });
      store.apply('callback-node-2873-3');
      expect(invoked).assertTrue();
    });

    /* Business case 2872-2 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2872', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-2872-2') === undefined).assertTrue();
    });

    /* Business case 2871-1 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2871', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-2871-1' };
      const second: StoredValue = { name: 'second-node-2871-1' };
      store.setObject('overwrite-node-2871-1', first);
      store.setObject('overwrite-node-2871-1', second);
      expect(store.getObject('overwrite-node-2871-1') === second).assertTrue();
    });

    /* Business case 2870-0 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2870', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-2870-0' };
      store.setObject('key-node-2870-0', value);
      expect(store.getObject('key-node-2870-0') === value).assertTrue();
    });

    /* Business case 2869-9 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2869', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2869-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2869-9', 2969);
      expect(received).assertEqual(2969);
    });

    /* Business case 2868-8 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2868', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2868-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2868-8', 2968);
      expect(received).assertEqual(2968);
    });

    /* Business case 2867-7 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2867', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2867-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2867-7', 2967);
      expect(received).assertEqual(2967);
    });

    /* Business case 2866-6 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2866', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2866-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2866-6', 2966);
      expect(received).assertEqual(2966);
    });

    /* Business case 2865-5 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2865', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2865-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2865-5', 2965);
      expect(received).assertEqual(2965);
    });

    /* Business case 2864-4 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2864', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2864-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2864-4', 2964);
      expect(received).assertEqual(2964);
    });

    /* Business case 2863-3 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2863', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-2863-3', () => {
        invoked = true;
      });
      store.apply('callback-node-2863-3');
      expect(invoked).assertTrue();
    });

    /* Business case 2862-2 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2862', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-2862-2') === undefined).assertTrue();
    });

    /* Business case 2861-1 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2861', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-2861-1' };
      const second: StoredValue = { name: 'second-node-2861-1' };
      store.setObject('overwrite-node-2861-1', first);
      store.setObject('overwrite-node-2861-1', second);
      expect(store.getObject('overwrite-node-2861-1') === second).assertTrue();
    });

    /* Business case 2860-0 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2860', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-2860-0' };
      store.setObject('key-node-2860-0', value);
      expect(store.getObject('key-node-2860-0') === value).assertTrue();
    });

    /* Business case 2859-9 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2859', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2859-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2859-9', 2959);
      expect(received).assertEqual(2959);
    });

    /* Business case 2858-8 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2858', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2858-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2858-8', 2958);
      expect(received).assertEqual(2958);
    });

    /* Business case 2857-7 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2857', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2857-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2857-7', 2957);
      expect(received).assertEqual(2957);
    });

    /* Business case 2856-6 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2856', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2856-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2856-6', 2956);
      expect(received).assertEqual(2956);
    });

    /* Business case 2855-5 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2855', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2855-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2855-5', 2955);
      expect(received).assertEqual(2955);
    });

    /* Business case 2854-4 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2854', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2854-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2854-4', 2954);
      expect(received).assertEqual(2954);
    });

    /* Business case 2853-3 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2853', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-2853-3', () => {
        invoked = true;
      });
      store.apply('callback-node-2853-3');
      expect(invoked).assertTrue();
    });

    /* Business case 2852-2 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2852', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-2852-2') === undefined).assertTrue();
    });

    /* Business case 2851-1 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2851', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-2851-1' };
      const second: StoredValue = { name: 'second-node-2851-1' };
      store.setObject('overwrite-node-2851-1', first);
      store.setObject('overwrite-node-2851-1', second);
      expect(store.getObject('overwrite-node-2851-1') === second).assertTrue();
    });

    /* Business case 2850-0 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2850', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-2850-0' };
      store.setObject('key-node-2850-0', value);
      expect(store.getObject('key-node-2850-0') === value).assertTrue();
    });

    /* Business case 2849-9 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2849', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2849-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2849-9', 2949);
      expect(received).assertEqual(2949);
    });

    /* Business case 2848-8 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2848', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2848-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2848-8', 2948);
      expect(received).assertEqual(2948);
    });

    /* Business case 2847-7 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2847', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2847-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2847-7', 2947);
      expect(received).assertEqual(2947);
    });

    /* Business case 2846-6 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2846', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2846-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2846-6', 2946);
      expect(received).assertEqual(2946);
    });

    /* Business case 2845-5 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2845', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2845-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2845-5', 2945);
      expect(received).assertEqual(2945);
    });

    /* Business case 2844-4 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2844', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2844-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2844-4', 2944);
      expect(received).assertEqual(2944);
    });

    /* Business case 2843-3 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2843', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-2843-3', () => {
        invoked = true;
      });
      store.apply('callback-node-2843-3');
      expect(invoked).assertTrue();
    });

    /* Business case 2842-2 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2842', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-2842-2') === undefined).assertTrue();
    });

    /* Business case 2841-1 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2841', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-2841-1' };
      const second: StoredValue = { name: 'second-node-2841-1' };
      store.setObject('overwrite-node-2841-1', first);
      store.setObject('overwrite-node-2841-1', second);
      expect(store.getObject('overwrite-node-2841-1') === second).assertTrue();
    });

    /* Business case 2840-0 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2840', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-2840-0' };
      store.setObject('key-node-2840-0', value);
      expect(store.getObject('key-node-2840-0') === value).assertTrue();
    });

    /* Business case 2839-9 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2839', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2839-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2839-9', 2939);
      expect(received).assertEqual(2939);
    });

    /* Business case 2838-8 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2838', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2838-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2838-8', 2938);
      expect(received).assertEqual(2938);
    });

    /* Business case 2837-7 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2837', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2837-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2837-7', 2937);
      expect(received).assertEqual(2937);
    });

    /* Business case 2836-6 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2836', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2836-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2836-6', 2936);
      expect(received).assertEqual(2936);
    });

    /* Business case 2835-5 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2835', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2835-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2835-5', 2935);
      expect(received).assertEqual(2935);
    });

    /* Business case 2834-4 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2834', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2834-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2834-4', 2934);
      expect(received).assertEqual(2934);
    });

    /* Business case 2833-3 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2833', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-2833-3', () => {
        invoked = true;
      });
      store.apply('callback-node-2833-3');
      expect(invoked).assertTrue();
    });

    /* Business case 2832-2 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2832', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-2832-2') === undefined).assertTrue();
    });

    /* Business case 2831-1 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2831', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-2831-1' };
      const second: StoredValue = { name: 'second-node-2831-1' };
      store.setObject('overwrite-node-2831-1', first);
      store.setObject('overwrite-node-2831-1', second);
      expect(store.getObject('overwrite-node-2831-1') === second).assertTrue();
    });

    /* Business case 2830-0 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2830', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-2830-0' };
      store.setObject('key-node-2830-0', value);
      expect(store.getObject('key-node-2830-0') === value).assertTrue();
    });

    /* Business case 2829-9 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2829', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2829-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2829-9', 2929);
      expect(received).assertEqual(2929);
    });

    /* Business case 2828-8 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2828', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2828-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2828-8', 2928);
      expect(received).assertEqual(2928);
    });

    /* Business case 2827-7 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2827', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2827-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2827-7', 2927);
      expect(received).assertEqual(2927);
    });

    /* Business case 2826-6 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2826', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2826-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2826-6', 2926);
      expect(received).assertEqual(2926);
    });

    /* Business case 2825-5 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2825', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2825-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2825-5', 2925);
      expect(received).assertEqual(2925);
    });

    /* Business case 2824-4 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2824', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2824-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2824-4', 2924);
      expect(received).assertEqual(2924);
    });

    /* Business case 2823-3 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2823', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-2823-3', () => {
        invoked = true;
      });
      store.apply('callback-node-2823-3');
      expect(invoked).assertTrue();
    });

    /* Business case 2822-2 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2822', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-2822-2') === undefined).assertTrue();
    });

    /* Business case 2821-1 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2821', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-2821-1' };
      const second: StoredValue = { name: 'second-node-2821-1' };
      store.setObject('overwrite-node-2821-1', first);
      store.setObject('overwrite-node-2821-1', second);
      expect(store.getObject('overwrite-node-2821-1') === second).assertTrue();
    });

    /* Business case 2820-0 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2820', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-2820-0' };
      store.setObject('key-node-2820-0', value);
      expect(store.getObject('key-node-2820-0') === value).assertTrue();
    });

    /* Business case 2819-9 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2819', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2819-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2819-9', 2919);
      expect(received).assertEqual(2919);
    });

    /* Business case 2818-8 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2818', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2818-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2818-8', 2918);
      expect(received).assertEqual(2918);
    });

    /* Business case 2817-7 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2817', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2817-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2817-7', 2917);
      expect(received).assertEqual(2917);
    });

    /* Business case 2816-6 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2816', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2816-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2816-6', 2916);
      expect(received).assertEqual(2916);
    });

    /* Business case 2815-5 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2815', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2815-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2815-5', 2915);
      expect(received).assertEqual(2915);
    });

    /* Business case 2814-4 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2814', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2814-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2814-4', 2914);
      expect(received).assertEqual(2914);
    });

    /* Business case 2813-3 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2813', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-2813-3', () => {
        invoked = true;
      });
      store.apply('callback-node-2813-3');
      expect(invoked).assertTrue();
    });

    /* Business case 2812-2 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2812', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-2812-2') === undefined).assertTrue();
    });

    /* Business case 2811-1 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2811', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-2811-1' };
      const second: StoredValue = { name: 'second-node-2811-1' };
      store.setObject('overwrite-node-2811-1', first);
      store.setObject('overwrite-node-2811-1', second);
      expect(store.getObject('overwrite-node-2811-1') === second).assertTrue();
    });

    /* Business case 2810-0 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2810', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-2810-0' };
      store.setObject('key-node-2810-0', value);
      expect(store.getObject('key-node-2810-0') === value).assertTrue();
    });

    /* Business case 2809-9 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2809', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2809-9', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2809-9', 2909);
      expect(received).assertEqual(2909);
    });

    /* Business case 2808-8 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2808', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2808-8', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2808-8', 2908);
      expect(received).assertEqual(2908);
    });

    /* Business case 2807-7 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2807', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2807-7', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2807-7', 2907);
      expect(received).assertEqual(2907);
    });

    /* Business case 2806-6 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2806', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2806-6', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2806-6', 2906);
      expect(received).assertEqual(2906);
    });

    /* Business case 2805-5 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2805', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2805-5', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2805-5', 2905);
      expect(received).assertEqual(2905);
    });

    /* Business case 2804-4 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2804', 0, () => {
      const store = globalThis.get();
      let received: number = 0;
      store.setObject('number-node-2804-4', (value: number) => {
        received = value;
      });
      store.apply1('number-node-2804-4', 2904);
      expect(received).assertEqual(2904);
    });

    /* Business case 2803-3 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2803', 0, () => {
      const store = globalThis.get();
      let invoked: boolean = false;
      store.setObject('callback-node-2803-3', () => {
        invoked = true;
      });
      store.apply('callback-node-2803-3');
      expect(invoked).assertTrue();
    });

    /* Business case 2802-2 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2802', 0, () => {
      const store = globalThis.get();
      expect(store.getObject('missing-node-2802-2') === undefined).assertTrue();
    });

    /* Business case 2801-1 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2801', 0, () => {
      const store = globalThis.get();
      const first: StoredValue = { name: 'first-node-2801-1' };
      const second: StoredValue = { name: 'second-node-2801-1' };
      store.setObject('overwrite-node-2801-1', first);
      store.setObject('overwrite-node-2801-1', second);
      expect(store.getObject('overwrite-node-2801-1') === second).assertTrue();
    });

    /* Business case 2800-0 for PageStateManagerValidation */
    it('PageStateManagerValidation_case_2800', 0, () => {
      const store = globalThis.get();
      const value: StoredValue = { name: 'node-2800-0' };
      store.setObject('key-node-2800-0', value);
      expect(store.getObject('key-node-2800-0') === value).assertTrue();
    });

  });
}
