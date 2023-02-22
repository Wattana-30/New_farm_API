{application,lwm2m_coap,
             [{description,"Constrained Application Protocol For LWM2M"},
              {vsn,"0.2.0"},
              {modules,[coap_core_iana,coap_core_link,coap_core_link_parser,
                        coap_core_link_scanner,lwm2m_coap_channel,
                        lwm2m_coap_channel_sup,lwm2m_coap_channel_sup_sup,
                        lwm2m_coap_client,lwm2m_coap_dtls_listen,
                        lwm2m_coap_dtls_listen_sup,lwm2m_coap_dtls_socket,
                        lwm2m_coap_dtls_socket_sup,lwm2m_coap_message,
                        lwm2m_coap_message_parser,lwm2m_coap_observer,
                        lwm2m_coap_resource,lwm2m_coap_responder,
                        lwm2m_coap_responder_sup,lwm2m_coap_server,
                        lwm2m_coap_server_content,lwm2m_coap_server_registry,
                        lwm2m_coap_test,lwm2m_coap_transport,
                        lwm2m_coap_udp_socket]},
              {registered,[]},
              {mod,{lwm2m_coap_server,[]}},
              {env,[]},
              {applications,[kernel,stdlib,ssl]}]}.