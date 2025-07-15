<template>
  <v-row justify="center" align="center">
    <v-col cols="12" sm="" md="">
      <v-data-table :headers="headers" :items="customers" :items-per-page="15" class="elevation-1" :loading="loading"
        loading-text="Loading please wait...">


        <template v-slot:item.profilePicture="{ item }">
          <v-badge color="grey" content="VIP" offset-x="80" offset-y="5" bordered v-if="item.isVip == true">
            <v-avatar size="80">

              <v-img
                lazy-src="https://imgs.search.brave.com/9Irbmm4AiOkd9XWhYCqRfR1VzM5v4f56tn9g_efqGs4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy8y/LzI0L01pc3Npbmdf/YXZhdGFyLnN2Zw"
                :src="item.profilePicture"></v-img>
            </v-avatar>
          </v-badge>

          <div v-else>
            <v-avatar size="80">
              <v-img
                lazy-src="https://imgs.search.brave.com/9Irbmm4AiOkd9XWhYCqRfR1VzM5v4f56tn9g_efqGs4/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy8y/LzI0L01pc3Npbmdf/YXZhdGFyLnN2Zw"
                :src="item.profilePicture"></v-img>
            </v-avatar>
          </div>
        </template>

        <template v-slot:item.actions="{ item }">
          <v-btn color="blue" @click="getCustomerDetails(item)">View</v-btn>
        </template>
      </v-data-table>
      <template>
        <div class="text-center">
          <v-dialog v-model="customerDialog" width="500">
            <v-card>
              <v-toolbar class="text-h5 gray">
                <v-icon>mdi-information</v-icon>
                <v-toolbar-title>
                  Customer Details
                </v-toolbar-title>
              </v-toolbar>
              <v-card-text class="mt-5">
                <v-row>
                  <v-col cols="12" md="4">
                    <v-img max-height="151" max-width="151" :src="customerPhoto"></v-img>
                  </v-col>
                  <v-col cols="12" md="8">
                    <v-list dense>
                      <v-list-item two-line>
                        <v-list-item-content>
                          <v-list-item-subtitle>Name</v-list-item-subtitle>
                          <v-list-item-title>{{ customerName }}</v-list-item-title>
                        </v-list-item-content>
                      </v-list-item>

                      <v-list-item two-line>
                        <v-list-item-content>
                          <v-list-item-subtitle>Age</v-list-item-subtitle>
                          <v-list-item-title>{{ customerAge }}</v-list-item-title>
                        </v-list-item-content>
                      </v-list-item>

                      <v-list-item two-line>
                        <v-list-item-content>
                          <v-list-item-subtitle>Phone</v-list-item-subtitle>
                          <v-list-item-title>{{ customerPhone }}</v-list-item-title>
                        </v-list-item-content>
                      </v-list-item>

                      <v-list-item two-line>
                        <v-list-item-content>
                          <v-list-item-subtitle>Address</v-list-item-subtitle>
                          <v-list-item-title>{{ customerEmail }}</v-list-item-title>
                        </v-list-item-content>
                      </v-list-item>
                    </v-list>
                  </v-col>
                </v-row>
              </v-card-text>
              <v-divider></v-divider>
              <v-card-actions><v-divider></v-divider>

            <v-card-actions>
           <v-spacer></v-spacer>
          <v-btn
        depressed
        color="blue"
      >
          UPDATE
    </v-btn>

    <v-btn
    depressed
    color="pink"
    >
    DELETE
  </v-btn>

        </v-card-actions>
      
                <v-spacer></v-spacer>
               
              </v-card-actions>
            </v-card>
          </v-dialog>
        </div>
      </template>
    </v-col>
  </v-row>
</template>

<script>
export default {
  name: "IndexPage",
  data() {
    return {
      headers: [

        {
          // text: 'ID',
          // align: 'start',
          // sortable: false,
          // value: 'id',
        },
        { text: "Photo", value: "profilePicture" },
        { text: "Name", value: "name" },
        { text: "Email", value: "email" },
        { text: "Phone", value: "phone" },
        { text: "Address", value: "address" },
        { text: "Age", value: "age" },
        { text: "Status", value: "isVip" },
        { text: "", value: "actions" },
      ],
      customers: [],
      customerPhoto: "",
      customerName: "",
      customerAge: 0,
      customerPhone: "",
      customerEmail: "",
      loading: true,
      customerDialog: false,

    };

  },
  methods: {
    getCustomers() {
      this.$axios
        .get("/customers")
        .then((response) => {
          console.log(response.data);
          this.customers = response.data;
          this.loading = false;
        })
        .catch((err) => {
          console.log(err);
        });

    },
    getCustomerDetails(item) {
      console.log(item);
      this.customerPhoto = item.profilePicture;
      this.customerName = item.name;
      this.customerAge = item.age;
      this.customerPhone = item.phone;
      this.customerEmail = item.email;
      this.customerDialog = true;
    },
  },



  mounted() {
    this.getCustomers();
  },

};

</script>