<!-- <template>
    <div class="relative w-full min-h-screen bg-black flex justify-center items-center">
        <button @click="goBack" class="absolute top-5 left-5 bg-white text-black p-2 rounded-full">
            <ChevronLeft class="h-6 w-6" />
        </button>
        
        <video ref="video" class="h-auto w-full" autoplay></video>
    </div>
</template>

<script>
import { ChevronLeft } from 'lucide-vue-next';

export default {
    name: "CameraComponent",
    components: {
        ChevronLeft
    },
    data() {
        return {
            stream: null,
        };
    },
    mounted() {
        this.openCamera();
    },
    methods: {
        async openCamera() {
            try {
                const stream = await navigator.mediaDevices.getUserMedia({ video: true });
                this.stream = stream;

                this.$nextTick(() => {
                    if (this.$refs.video) {
                        this.$refs.video.srcObject = stream;
                    } else {
                        console.error('Référence vidéo introuvable');
                    }
                });
            } catch (error) {
                console.error('Erreur lors de l\'ouverture de la caméra :', error);
            }
        },
        closeCamera() {
            if (this.stream) {
                this.stream.getTracks().forEach(track => track.stop());
                this.stream = null;
            }
        },
        goBack() {
            this.closeCamera();
            this.$router.back();
        }
    },
    beforeDestroy() {
        this.closeCamera();
    }
};
</script>

<style scoped>
video {
    object-fit: cover;
}
</style> -->


<!-- <template>
    <div class="relative w-full min-h-screen bg-black flex justify-center items-center">
        <button @click="goBack" class="absolute top-5 left-5 bg-white text-black p-2 rounded-full">
            <ChevronLeft class="h-6 w-6" />
        </button>
        
        <video ref="video" class="h-auto w-full" autoplay playsinline></video>
    </div>
</template>

<script>
import { ChevronLeft } from 'lucide-vue-next';

export default {
    name: "CameraComponent",
    components: {
        ChevronLeft
    },
    data() {
        return {
            stream: null,
        };
    },
    mounted() {
        this.openCamera();
    },
    methods: {
        async openCamera() {
            try {
                // Demande d'accès à la caméra arrière avec facingMode: "environment"
                const stream = await navigator.mediaDevices.getUserMedia({
                    video: {
                        facingMode: { ideal: "environment" } // Caméra arrière
                    }
                });
                this.stream = stream;

                // Attacher le flux vidéo à l'élément <video>
                this.$nextTick(() => {
                    if (this.$refs.video) {
                        this.$refs.video.srcObject = stream;
                    } else {
                        console.error('Référence vidéo introuvable');
                    }
                });
            } catch (error) {
                console.error('Erreur lors de l\'ouverture de la caméra :', error);
            }
        },
        closeCamera() {
            if (this.stream) {
                this.stream.getTracks().forEach(track => track.stop());
                this.stream = null;
            }
        },
        goBack() {
            this.closeCamera();
            this.$router.back();
        }
    },
    beforeDestroy() {
        this.closeCamera();
    }
};
</script>

<style scoped>
video {
    object-fit: cover;
}
</style> -->



<template>
    <div class="relative w-full min-h-screen bg-black flex flex-col justify-center items-center">
      <button @click="goBack" class="absolute top-5 left-5 bg-white text-black p-2 rounded-full">
        <ChevronLeft class="h-6 w-6" />
      </button>
  
      <!-- Composant QR Code Reader -->
      <qrcode-stream @decode="onDecode" @init="onInit" />
  
      <!-- Affichage du résultat du QR Code scanné -->
      <div v-if="qrCodeData" class="text-white mt-5">
        <p>QR Code Scanné :</p>
        <p>{{ qrCodeData }}</p>
      </div>
    </div>
  </template>
  
  <script>
  import { ChevronLeft } from 'lucide-vue-next';
  import { QrcodeStream } from 'vue-qrcode-reader'; // Importation du scanner QR code
  
  export default {
    name: "QrScannerComponent",
    components: {
      ChevronLeft,
      QrcodeStream,  // Utilisation du composant QrcodeStream
    },
    data() {
      return {
        qrCodeData: null,  // Pour stocker les données du QR code
      };
    },
    methods: {
      onDecode(result) {
        this.qrCodeData = result; // Stocker les données du QR code
        console.log("QR Code détecté :", result);
      },
      onInit(promise) {
        promise.catch(error => {
          console.error("Erreur d'initialisation du scanner :", error);
        });
      },
      goBack() {
        this.$router.back(); // Retour à la page précédente
      },
    },
  };
  </script>
  
  <style scoped>
  video {
    object-fit: cover;
  }
  </style>
  