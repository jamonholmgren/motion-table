#import <UIKit/UIKit.h>

extern "C" {
    void ruby_sysinit(int *, char ***);
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void ruby_set_argv(int, char **);
    void rb_vm_init_compiler(void);
    void rb_vm_init_jit(void);
    void rb_vm_aot_feature_provide(const char *, void *);
    void *rb_vm_top_self(void);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
void MREP_C9C3271B0CF54727BD0AFA97E35BB102(void *, void *);
void MREP_AC492653D8D44373AB6CB6AB4EB4F890(void *, void *);
void MREP_AEBA70E5B3F74F83B4AB64F2BF33AFA0(void *, void *);
void MREP_DB28EA1FFEAD472F84A09FEA2141DD00(void *, void *);
}

extern "C"
void
RubyMotionInit(int argc, char **argv)
{
    static bool initialized = false;
    if (!initialized) {
	ruby_init();
	ruby_init_loadpath();
        if (argc > 0) {
	    const char *progname = argv[0];
	    ruby_script(progname);
	}
	try {
	    void *self = rb_vm_top_self();
MREP_C9C3271B0CF54727BD0AFA97E35BB102(self, 0);
MREP_AC492653D8D44373AB6CB6AB4EB4F890(self, 0);
MREP_AEBA70E5B3F74F83B4AB64F2BF33AFA0(self, 0);
MREP_DB28EA1FFEAD472F84A09FEA2141DD00(self, 0);
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
	initialized = true;
    }
}
