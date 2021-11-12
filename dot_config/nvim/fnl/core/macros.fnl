(global core/pack (vector))

(fn pack [name ?options]
  "Returns a mixed table with a plugin as the first sequential and the options
  as hash-table items.
  See https://github.com/wbthomason/packer.nvim for information about the
  options."
  (let [options (if (or (nil? ?options) (empty? ?options))
                    (hash-map)
                    (collect [k v (pairs ?options)]
                      (if (= k :req)
                          (values :config
                                  (format "require('crux.core.pack.%s')" v))
                          (= k :init)
                          (values :config (format "require('%s').setup()" v))
                          (values k v))))]
    (conj options [1 name])))

(fn pack! [name ?options]
  "Declares a plugin with its options.
  See https://github.com/wbthomason/packer.nvim for information about the
  options."
  (global core/pack (conj core/pack (pack name ?options))))

{: pack!}

