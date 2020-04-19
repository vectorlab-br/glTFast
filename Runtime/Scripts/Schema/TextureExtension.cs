// Copyright 2020 Andreas Atteneder
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

namespace GLTFast.Schema {

    [System.Serializable]
    public class TextureExtension {

        [System.Obsolete("to be replaced by KHR_texture_basisu")]
        public TextureFormat KHR_texture_cttf = null;
        public TextureFormat KHR_texture_basisu = null;
    }

    [System.Serializable]
    public class TextureFormat {
        public int source = -1;
    }
}
