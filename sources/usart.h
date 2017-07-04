
void usart_setup(void);
void usart_send_byte(int byte);
void usart_send(unsigned char *BufferPtr, unsigned short Length );
void process_command(char *cmd);
double atof(const char *s);
